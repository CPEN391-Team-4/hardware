import sim_dct::*;

module tb_dct_1d();
   logic clk, rst, ena_in;
   logic signed [7:0] a_in;
   logic signed [11:0] S_out;
   
   dct_1d DUT(.*);

   localparam int testblock[8][8] = '{
     '{65,  84,  88,   74,   71,   84,   91,   86},
     '{89,  82,  80,   87,   91,   86,   76,   69},
     '{91,  80,  69,   62,   51,   37,   29,   28},
     '{41,  39,  26,    9,    6,   13,   11,    1},
     '{ 4,  -1,  -6,    2,   21,   25,   -3,  -38},
     '{ 0,  -2,  14,   38,   33,   -9,  -56,  -82},
     '{11,  19,  32,   30,   -9,  -61,  -83,  -77},
     '{49,  49,  29,  -15,  -61,  -81,  -73,  -58}
   };

   initial forever begin
      clk = 0; #1;
      clk = 1; #1;
   end

   task dct_test(input int a[8][8]);
      real S[8][8];
      for (int i = 0; i < 8; i++)
        S[i] = dct_approx(a[i]);

      ena_in = 1;
      fork
         // Process to push things into the pipelinee
         begin
            for (int row = 0; row < 8; row++)
              for (int col = 0; col < 8; col++) begin
                 a_in = a[row][col]; #2;
              end
            a_in = 'x;
         end

         // Process checking coefficients that come out
         begin
            // First row of coefficients takes 48 clocks to emerge.
            #96;
            for (int row = 0; row < 8; row++)
              for (int col = 0; col < 8; col++) begin
                 $display("computed = %f", S[row][col]);
                 $display("S[%d][%d] = %d", row, col, S_out); #2;
              end
         end
      join
      ena_in = 0;
   endtask // dct_test

   initial begin
      rst = 1;
      #2;
      rst = 0;
      dct_test(testblock);
   end
endmodule // tb_dct_1d
