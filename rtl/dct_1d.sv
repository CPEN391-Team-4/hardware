module dct_1d
  (input logic clk, rst, ena_in,
   input logic [7:0] a_in,
   output logic [11:0] S_out
   );

   logic [2:0] state;
   logic shiftout;
   assign shiftout = state == 7;

   logic signed [7:0]  a[8];
   logic signed [8:0]  b[8];
   logic signed [9:0]  c[8];
   logic signed [10:0] d[8];
   logic signed [10:0] e[8];
   logic signed [11:0] f[8];

   logic signed [10:0] d_8;
   logic signed [10:0] e_8;

   logic signed [8:0]  b_in;
   logic signed [9:0]  c_in;
   logic signed [10:0] d_in;
   logic signed [10:0] e_in;
   logic signed [11:0] f_in;

   logic signed [19:0] m_tmp;
   logic signed [10:0] m_out;
   logic signed [10:0] m_in[2];
   assign m_tmp = m_in[0] * m_in[1];
   assign m_out = m_tmp[19:9];

   // Constants (all in two's complement Q1.9 format)
   localparam [10:0] m1 = 11'h16a; // m1 = cos(4 π / 16)
   localparam [10:0] m2 = 11'h0c3; // m2 = cos(6 π / 16)
   localparam [10:0] m3 = 11'h115; // m3 = cos(2 π / 16) - cos(6 π / 16)
   localparam [10:0] m4 = 11'h29c; // m4 = cos(2 π / 16) + cos(6 π / 16)

   // SystemVerilog interprets signed packed arrays as if the entire
   // vector were signed.  WAT.  Have to use unpacked arrays instead.
   // Quartus doesn't support the streaming operator to convert
   // automatically, so we have to do it by hand.
   pingpong_buffer #(8)  BUF_A(.in(a_in), .out('{a[7], a[6], a[5], a[4], a[3], a[2], a[1], a[0]}), .*);
   pingpong_buffer #(9)  BUF_B(.in(b_in), .out('{b[7], b[6], b[5], b[4], b[3], b[2], b[1], b[0]}), .*);
   pingpong_buffer #(10) BUF_C(.in(c_in), .out('{c[7], c[6], c[5], c[4], c[3], c[2], c[1], c[0]}), .*);
   pingpong_buffer #(11) BUF_D(.in(d_in), .out('{d[7], d[6], d[5], d[4], d[3], d[2], d[1], d[0]}), .*);
   pingpong_buffer #(11) BUF_E(.in(e_in), .out('{e[7], e[6], e[5], e[4], e[3], e[2], e[1], e[0]}), .*);
   pingpong_buffer #(12) BUF_F(.in(f_in), .out('{f[7], f[6], f[5], f[4], f[3], f[2], f[1], f[0]}), .*);

   always_ff @(posedge clk)
     if (rst)
       state <= 0;
     else begin
        if (ena_in)
          state <= state + 1;
        if (shiftout) begin
           d_8 <= c[7];
           e_8 <= d_8;
        end
     end

   always_comb begin
      case (state)
        0: b_in = a[0] + a[7];
        1: b_in = a[1] + a[6];
        2: b_in = a[2] - a[4];
        3: b_in = a[1] - a[6];
        4: b_in = a[2] + a[5];
        5: b_in = a[3] + a[4];
        6: b_in = a[2] - a[5];
        7: b_in = a[0] - a[7];
      endcase // case (state)

      case (state)
        0: c_in = b[0] + b[5];
        1: c_in = b[1] - b[4];
        2: c_in = b[2] + b[6];
        3: c_in = b[1] + b[4];
        4: c_in = b[0] - b[5];
        5: c_in = b[3] + b[7];
        6: c_in = b[3] + b[6];
        7: c_in = b[7];
      endcase // case (state)

      case (state)
        0: d_in = c[0] + c[3];
        1: d_in = c[0] - c[3];
        2: d_in = c[2];
        3: d_in = c[1] + c[4];
        4: d_in = c[2] - c[5];
        5: d_in = c[4];
        6: d_in = c[5];
        7: d_in = c[6];
      endcase // case (state)

      m_in[0] = 'x;
      m_in[1] = 'x;
      case (state)
        0: e_in = d[0];
        1: e_in = d[1];
        2: begin e_in = m_out; m_in = '{m3, d[2]}; end
        3: begin e_in = m_out; m_in = '{m1, d[7]}; end
        4: begin e_in = m_out; m_in = '{m4, d[6]}; end
        5: e_in = d[5];
        6: begin e_in = m_out; m_in = '{m1, d[3]}; end
        7: begin e_in = m_out; m_in = '{m2, d[4]}; end
      endcase // case (state)

      case (state)
        0: f_in = e[0];
        1: f_in = e[1];
        2: f_in = e[5] + e[6];
        3: f_in = e[5] - e[6];
        4: f_in = e[3] + e_8;
        5: f_in = e_8 - e[3];
        6: f_in = e[2] + e[7];
        7: f_in = e[4] + e[7];
      endcase // case (state)

      case (state)
        0: S_out = f[0];
        1: S_out = f[4] + f[7];
        2: S_out = f[2];
        3: S_out = f[5] - f[6];
        4: S_out = f[1];
        5: S_out = f[5] + f[6];
        6: S_out = f[3];
        7: S_out = f[4] - f[7];
      endcase // case (state)
   end // always_comb
endmodule // dct_1d