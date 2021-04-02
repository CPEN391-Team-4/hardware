
module trdb_d5m (
	clk_sys_clk,
	clk_trdb_d5m_pixclk_clk,
	cmos_sensor_acquisition_0_cmos_sensor_input_irq_irq,
	i2c_scl,
	i2c_sda,
	i2c_interrupt_sender_irq,
	master_address,
	master_write,
	master_byteenable,
	master_writedata,
	master_waitrequest,
	master_burstcount,
	msgdma_csr_irq_irq,
	reset_reset_n,
	slave_waitrequest,
	slave_readdata,
	slave_readdatavalid,
	slave_burstcount,
	slave_writedata,
	slave_address,
	slave_write,
	slave_read,
	slave_byteenable,
	slave_debugaccess,
	trdb_d5m_d_frame_valid,
	trdb_d5m_d_line_valid,
	trdb_d5m_d_data);	

	input		clk_sys_clk;
	input		clk_trdb_d5m_pixclk_clk;
	output		cmos_sensor_acquisition_0_cmos_sensor_input_irq_irq;
	inout		i2c_scl;
	inout		i2c_sda;
	output		i2c_interrupt_sender_irq;
	output	[31:0]	master_address;
	output		master_write;
	output	[3:0]	master_byteenable;
	output	[31:0]	master_writedata;
	input		master_waitrequest;
	output	[4:0]	master_burstcount;
	output		msgdma_csr_irq_irq;
	input		reset_reset_n;
	output		slave_waitrequest;
	output	[31:0]	slave_readdata;
	output		slave_readdatavalid;
	input	[0:0]	slave_burstcount;
	input	[31:0]	slave_writedata;
	input	[6:0]	slave_address;
	input		slave_write;
	input		slave_read;
	input	[3:0]	slave_byteenable;
	input		slave_debugaccess;
	input		trdb_d5m_d_frame_valid;
	input		trdb_d5m_d_line_valid;
	input	[11:0]	trdb_d5m_d_data;
endmodule
