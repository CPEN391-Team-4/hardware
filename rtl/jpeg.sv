// Controller for the JPEG pipeline that accepts an image in YUYV
// 4:2:2 format in memory and write a raw JPEG stream to the output.
//
// The width and height of the image must be multiples of 8.  The
// output buffer must be large to hold the entire source image.
//
// We raise an interrupt when done.  Address/
// 
// Memory mapped interface (offsets are in words):
//
//   0 Image width (rw)
//   1 Image height (rw)
//   2 Source image address here (rw)
//   3 Destination address (rw)
//   4 Output image size (r)
//   5 Write to start encoding, read to see if busy (rw)
module jpeg(input logic clk, input logic rst,
            input logic [2:0] s_address,
            input logic s_read, input logic s_write,
            output logic [31:0] s_readdata,
            input logic [31:0] s_writedata,

            input logic m_waitrequest,
            output logic [30:0] m_address,
            output logic m_read, output logic m_write,
            input logic [15:0] m_readdata,
            output logic [15:0] m_writedata,
            output logic [1:0] m_byteenable,
            
            output logic irq);

   logic [7:0] in_pixel;
   logic [15:0] out_bits;

   logic [1:0] out_valid;

   logic done_image;
   logic done_block;
   logic done_flush;

   logic ena_in;
   logic ena_out;

   logic rdy_in;
   logic rdy_out;

   jpeg_pipeline PIPE(.rst_ext(rst), .*);

   // Which pixel we are on (reading).
   logic [15:0] cur_x;
   logic [15:0] cur_y;

   // Current offset into the output, in multiples of 2 bytes.
   logic [30:0] cur_out_off;
   
   logic busy;

   logic out_locked;
   logic [15:0] out_bits_locked;
   logic [15:0] out_valid_locked;
   logic out_locked_done_flush;

   logic in_locked;
   logic [7:0] in_bits_locked;

   logic [15:0] control_width;
   logic [15:0] control_height;
   logic [31:0] control_src;
   logic [31:0] control_dst;
   logic [31:0] control_size;

   // Every pixel has been pushed into the pipeline.
   logic all_pushed;

   // How many blocks the pipeline has processed.  Once we've hit the
   // total number, we flush the pipeline and finally give the
   // interrupt.
   logic [15:0] processed_blocks;
   
   always_ff @(posedge clk)
     if (rst) begin
        busy <= '0;
        cur_x <= '0;
        cur_y <= '0;
        cur_out_off <= '0;
        control_width <= '0;
        control_height <= '0;
        control_src <= '0;
        control_dst <= '0;
        control_size <= '0;
        irq <= '0;
        out_locked <= '0;
        processed_blocks <= '0;
        out_locked <= '0;
        in_locked <= '0;
     end else begin
        if (s_write)
          case (s_address)
            3'd0: control_width <= {s_writedata[7:0], s_writedata[15:8]};
            3'd1: control_height <= {s_writedata[7:0], s_writedata[15:8]};
            3'd2: control_src <= {s_writedata[7:0], s_writedata[15:8], s_writedata[23:16], s_writedata[31:24]};
            3'd3: control_dst <= {s_writedata[7:0], s_writedata[15:8], s_writedata[23:16], s_writedata[31:24]};
            3'd5: busy <= '1;
            default: ;
          endcase // case (s_address)

        if (ena_out) begin
           out_locked <= '1;
           out_bits_locked <= out_bits;
           out_valid_locked <= out_valid;
           out_locked_done_flush <= done_flush;
        end

        if (out_locked) begin
           // We hold the write command until the HPS deasserts
           // waitrequest, and then we remove our command.
           if (!m_waitrequest) begin
              out_locked <= '0;
              cur_out_off <= cur_out_off + 31'b1;
              
              // Image all done and written.
              if (out_locked_done_flush) begin
                 busy <= '0;
                 control_size <= {cur_out_off, 1'b0};
                 irq <= '1;
                 cur_x <= '0;
                 cur_y <= '0;
                 cur_out_off <= '0;
              end else
                irq <= '0;
           end else // if (!m_waitrequest)
             irq <= '0;
        end else // if (out_locked)
          irq <= '0;
        
        if (ena_in)
          in_locked <= '0;

        if (m_read) begin
           if (!m_waitrequest) begin
              in_locked <= '1;
              in_bits_locked <= m_readdata;

              // If we're at the edge (width) of this block, we go to
              // the next row of the same block.  If we're at the last
              // row, go to the next block.
              if (cur_x[2:0] == '1) begin
                 // At the last row of this block.
                 if (cur_y[2:0] == '1) begin
                    // Go to next block.
                    if (cur_x == control_width) begin
                       // Next block starts on the next row, all the
                       // way on the left.
                       cur_x <= '0;
                       cur_y <= cur_y + 16'b1;
                    end else begin
                       // Next block starts on the right, back at the
                       // first row of this block.
                       cur_x <= cur_x + 16'b1;
                       cur_y <= {cur_y[15:3], 3'b0};
                    end
                 end else begin // if (cur_y[2:0] == '1)
                    cur_x <= {cur_x[15:3], 3'b0};
                    cur_y <= cur_y + 16'b1;
                 end // else: !if(cur_y[2:0] == '1)
              end else begin // if (cur_x[2:0] == '1)
                 cur_x <= cur_x + 16'b1;
              end // else: !if(cur_x[2:0] == '1)
           end
        end

        if (done_block) begin
           processed_blocks <= processed_blocks + 15'b1;
           done_image <= processed_blocks == control_width[15:3] * control_height[15:3];
        end else begin
           done_image <= '0;
        end
     end

   always_comb begin
      s_readdata = 32'hdeadbeef;

      if (s_read)
        case (s_address)
          3'd0: s_readdata = {control_width[7:0], control_width[15:8], 16'b0};
          3'd1: s_readdata = {control_height[7:0], control_height[15:8], 16'b0};
          3'd2: s_readdata = {control_src[7:0], control_src[15:8], control_src[23:16], control_src[31:24]};
          3'd3: s_readdata = {control_dst[7:0], control_dst[15:8], control_dst[23:16], control_dst[31:24]};
          3'd4: s_readdata = {control_size[7:0], control_size[15:8], control_size[23:16], control_size[31:24]};
          3'd5: s_readdata = {8'b1, 24'b0};
        endcase // case (s_address)

      m_write = '0;
      m_read = '0;

      in_pixel = in_bits_locked;
      
      all_pushed = cur_y == control_height;

      ena_in = in_locked;
      rdy_in = !out_locked;

      m_writedata = 'x;
      m_address = 'x;
      m_byteenable = '0;
      
      // Words
      if (out_locked) begin
         m_address = control_dst[31:1] + cur_out_off;
         m_byteenable = out_valid_locked;
         m_writedata = out_bits_locked;
         m_write = 1'b1;
      end else if (!in_bits_locked && busy && !all_pushed) begin
         // We skip every second (chrominance) byte.
         m_address = control_src[31:1] + cur_x + (cur_y * control_width);
         m_byteenable = 2'b10;
         m_read = 1'b1;
      end
   end
   
endmodule // jpeg
