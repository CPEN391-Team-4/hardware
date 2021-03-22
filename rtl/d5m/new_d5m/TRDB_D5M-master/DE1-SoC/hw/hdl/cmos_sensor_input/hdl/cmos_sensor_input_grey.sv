module cmos_sensor_input_grey (input clk, input rst, input stop_and_reset,
                                );

    parameter PIX_DEPTH_RAW = 12;
    parameter PIX_DEPTH_RGB = 8;
    parameter MAX_WIDTH = 1280;
endmodule // cmos_sensor_input_grey