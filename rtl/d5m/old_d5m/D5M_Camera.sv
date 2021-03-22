// Top-level module for controlling D5M Camera

module D5M_Camera (input clk, input rst, inout [40:1] GPIO_1, input [3:0] KEY
                    // SDRAM IO
                    );

    logic		    [11:0]		D5M_D;          // input
    logic		          		D5M_FVAL;       // input
    logic		          		D5M_LVAL;       // input
    logic		          		D5M_PIXLCLK;    // input
    logic		          		D5M_RESET_N;    // output
    logic		          		D5M_SCLK;       // output
    logic		          		D5M_SDATA;      // inout
    logic		          		D5M_STROBE;     // input
    logic		          		D5M_TRIGGER;    // output
    logic		          		D5M_XCLKIN;     // output

    // MAKE SURE YOU USE BIDIRECTIONAL PORTS CORRECTLY
    assign D5M_D = {GPIO_1[2], GPIO_1[4], GPIO_1[5], GPIO_1[6],
                    GPIO_1[7], GPIO_1[8], GPIO_1[9], GPIO_1[10],
                    GPIO_1[13], GPIO_1[14], GPIO_1[15], GPIO_1[16]};
    assign D5M_FVAL = GPIO_1[25];
    assign D5M_LVAL = GPIO_1[24];
    assign D5M_PIXLCLK = GPIO_1[1];
    assign GPIO_1[20] = D5M_RESET_N;
    assign GPIO_1[27] = D5M_SCLK;
    // Assignment for D5M_SDATA
    assign D5M_STROBE = GPIO_1[23];
    assign GPIO_1[22] = D5M_TRIGGER;
    assign GPIO_1[19] = D5M_XCLKIN;

    /*
    Modules from demo being used:
        RAW2GREY
            Line_Buffer1 being used internally (Needs to be modified)
        CCD_Capture
        Reset_Delay
        Sdram_Control (Needs to be modified)
        sdram_pll
        I2C_CCD_Config???



    Quartus IP's to keep in mind:
        On Chip Memory/FIFO
        On Chip Memory/Shift register (RAM-based)
    */



endmodule