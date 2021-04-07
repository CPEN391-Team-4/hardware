#include <linux/fs.h>
#include <linux/io.h>
#include <linux/miscdevice.h>
#include <linux/mod_devicetable.h>
#include <linux/module.h>
#include <linux/of_address.h>
#include <linux/platform_device.h>
#include <linux/slab.h>
#include <linux/uaccess.h>
#include <linux/dma-mapping.h>
#include <linux/interrupt.h>

#define DRIVER_NAME "team4_jpeg"

#define JPEG_MAX_IMAGE_SIZE 640*480

struct team4_jpeg_dev {
	struct resource res;
	void __iomem *virtbase;
	/* YUYV 4:2:2 image goes here. */
	void *sourcebuf;
	/* JPEG compressed image goes here. */
	void *destbuf;
	int irq;

	int width;
	int height;

	/*
	 * If the accelerator has indicated that our image has
	 * finished compressing, we will wake this waitqueue and set
	 * the variable.
	 */
	wait_queue_head_t donequeue;
	int done;
} dev;

/*
 * The interface: write two bytes (little-endian) for the width, two
 * bytes for the height, and then the YUYV 4:2:2 image data.
 */
static ssize_t team4_jpeg_write(struct file *f, const char __user *user_buf,
				size_t size, loff_t *offset)
{
	u16 width = 0, height = 0;
	if (size > JPEG_MAX_IMAGE_SIZE * 2 + 4 || size < 4)
		return -EINVAL;

	if (size != width * height * 2 + 4)
		return -EINVAL;

	if (copy_from_user(&width, user_buf + 0, 2))
		return -EFAULT;
	if (copy_from_user(&height, user_buf + 2, 2))
		return -EFAULT;

	dev.width = width;
	dev.height = height;

	/* Write the width and height into the control registers. */
	iowrite16(width, dev.virtbase);
	iowrite16(height, dev.virtbase + 2);

	/*
	 * Write the source/dest buf physical addresses into the control
	 * registers.
	 */
	iowrite32(__virt_to_bus((u32)dev.sourcebuf), dev.virtbase + 4);
	iowrite32(__virt_to_bus((u32)dev.destbuf), dev.virtbase + 6);

	/*
	 * Put the user image into the physically contiguous buffer
	 * that the accelerator will actually read from.
	 */
	if (copy_from_user(dev.sourcebuf, user_buf + 4, width * height * 2))
		return -EFAULT;

	/* Start the accelerator. */
	iowrite8(1, dev.virtbase + 10);
	pr_info("jpeg started (%dx%d)\n", width, height);

	return size;
}

static int team4_jpeg_read(struct file *f, char __user *user_buf,
			   size_t size, loff_t *offset)
{
	int ret;
	if (size != dev.width * dev.height * 2)
		return -EINVAL;

	ret = wait_event_interruptible(dev.donequeue, dev.done);
	if (ret) {
		return ret;
	}

	/* The accelerator is done. */
	pr_info("jpeg read\n");	

	if (copy_to_user(user_buf, dev.destbuf, size))
		return -EFAULT;

	return size;
}

irqreturn_t team4_jpeg_interrupt_handler(int irq, void *dev_id)
{
	pr_info("jpeg done\n");
	dev.done = 1;
	wake_up(&dev.donequeue);
	return IRQ_HANDLED;
}

static const struct file_operations team4_jpeg_fops = {
	.owner = THIS_MODULE,
	.write = team4_jpeg_write,
	.read = team4_jpeg_read,
};

static struct miscdevice team4_jpeg_misc_device = {
	.minor = MISC_DYNAMIC_MINOR,
	.name = DRIVER_NAME,
	.fops = &team4_jpeg_fops,
};

static struct platform_driver team4_jpeg_platform_driver;

static int platform_probe(struct platform_device *pdev)
{
	int ret = misc_register(&team4_jpeg_misc_device);
	if (ret) {
		return ret;
	}

	init_waitqueue_head(&dev.donequeue);

	dev.irq = platform_get_irq(pdev, 0);
	pr_info("irq: %d\n", dev.irq);
	if (dev.irq < 0) {
		ret = -EINVAL;
		goto out_deregister;
	}

	ret = of_address_to_resource(pdev->dev.of_node, 0, &dev.res);
	if (ret) {
		pr_err("IORESOURCE_MEM failed");
		goto out_deregister;
	}

	if (!request_mem_region(dev.res.start, resource_size(&dev.res),
				DRIVER_NAME)) {
		goto out_deregister;
	}

	dev.virtbase = of_iomap(pdev->dev.of_node, 0);
	if (!dev.virtbase) {
		goto out_release_mem_region;
	}

	pr_info("start: %08x\n", dev.res.start);
	pr_info("end: %08x\n", dev.res.end);
	pr_info("name: %s\n", dev.res.name);

	dev.sourcebuf = kmalloc(JPEG_MAX_IMAGE_SIZE*2, GFP_KERNEL);
	dev.destbuf = kmalloc(JPEG_MAX_IMAGE_SIZE*2, GFP_KERNEL);
	
	if (!dev.sourcebuf || !dev.destbuf) {
		ret = -ENOMEM;
		goto out_release_mem_region;
	}

	pr_info("source phys: %08x\n", __virt_to_bus((u32)dev.sourcebuf));
	pr_info("dest phys: %08x\n", __virt_to_bus((u32)dev.destbuf));

	ret = request_irq(dev.irq,
			  team4_jpeg_interrupt_handler,
			  0,
			  DRIVER_NAME,
			  &team4_jpeg_platform_driver);
	if (ret) {
		goto out_kfree;
	}

	return 0;

out_kfree:
	kfree(dev.sourcebuf);
	kfree(dev.destbuf);

out_release_mem_region:
	release_mem_region(dev.res.start, resource_size(&dev.res));

out_deregister:
	misc_deregister(&team4_jpeg_misc_device);
	return ret;
}

static int platform_remove(struct platform_device *pdev)
{
	iounmap(dev.virtbase);
	release_mem_region(dev.res.start, resource_size(&dev.res));
	misc_deregister(&team4_jpeg_misc_device);
	kfree(dev.sourcebuf);
	kfree(dev.destbuf);
	free_irq(dev.irq, &team4_jpeg_platform_driver);
	return 0;
}

static struct of_device_id team4_jpeg_dt_ids[] = {
	{ .compatible = "team4,jpeg_enc-1.0" },
	{}
};

MODULE_DEVICE_TABLE(of, team4_jpeg_dt_ids);

static struct platform_driver team4_jpeg_platform_driver = {
	.probe = platform_probe,
	.remove = platform_remove,
	.driver = {
		.name = DRIVER_NAME,
		.owner = THIS_MODULE,
		.of_match_table = team4_jpeg_dt_ids,
	}
};
static int __init team4_jpeg_init(void)
{
	int ret;
	pr_info("JPEG encoder module loaded\n");

	ret = platform_driver_register(&team4_jpeg_platform_driver);
	if (ret) {
		pr_err("error registering platform driver: %d\n", ret);
		return ret;
	}
	
	return 0;
}

static void __exit team4_jpeg_exit(void)
{
	platform_driver_unregister(&team4_jpeg_platform_driver);
	pr_info("JPEG encoder module unloaded\n");
}

module_init(team4_jpeg_init);
module_exit(team4_jpeg_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Sam Schweigel");
MODULE_DESCRIPTION("Team 4 CPEN391 JPEG encoder driver");
MODULE_VERSION("1.0");
