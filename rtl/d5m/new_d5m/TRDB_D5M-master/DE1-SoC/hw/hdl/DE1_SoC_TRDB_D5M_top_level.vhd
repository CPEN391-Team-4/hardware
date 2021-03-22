-- #############################################################################
-- DE1_SoC_TRDB_D5M_top_level.vhd
--
-- BOARD         : DE1-SoC from Terasic
-- Author        : Sahand Kashani-Akhavan from Terasic documentation
-- Revision      : 1.6
-- Creation date : 04/02/2015
--
-- Syntax Rule : GROUP_NAME_N[bit]
--
-- GROUP  : specify a particular interface (ex: SDR_)
-- NAME   : signal name (ex: CONFIG, D, ...)
-- bit    : signal index
-- _N     : to specify an active-low signal
-- #############################################################################

library ieee;
use ieee.std_logic_1164.all;

entity DE1_SoC_TRDB_D5M_top_level is
    port(
        ---- ADC
        --ADC_CS_n           : out   std_logic;
        --ADC_DIN            : out   std_logic;
        --ADC_DOUT           : in    std_logic;
        --ADC_SCLK           : out   std_logic;

        ---- Audio
        --AUD_ADCDAT         : in    std_logic;
        --AUD_ADCLRCK        : inout std_logic;
        --AUD_BCLK           : inout std_logic;
        --AUD_DACDAT         : out   std_logic;
        --AUD_DACLRCK        : inout std_logic;
        --AUD_XCK            : out   std_logic;

        -- CLOCK
        CLOCK_50           : in    std_logic;
        --CLOCK2_50          : in    std_logic;
        --CLOCK3_50          : in    std_logic;
        --CLOCK4_50          : in    std_logic;

        -- SDRAM
        DRAM_ADDR          : out   std_logic_vector(12 downto 0);
        DRAM_BA            : out   std_logic_vector(1 downto 0);
        DRAM_CAS_N         : out   std_logic;
        DRAM_CKE           : out   std_logic;
        DRAM_CLK           : out   std_logic;
        DRAM_CS_N          : out   std_logic;
        DRAM_DQ            : inout std_logic_vector(15 downto 0);
        DRAM_LDQM          : out   std_logic;
        DRAM_RAS_N         : out   std_logic;
        DRAM_UDQM          : out   std_logic;
        DRAM_WE_N          : out   std_logic;

        ---- I2C for Audio and Video-In
        --FPGA_I2C_SCLK      : out   std_logic;
        --FPGA_I2C_SDAT      : inout std_logic;

        ---- SEG7
        --HEX0_N             : out   std_logic_vector(6 downto 0);
        --HEX1_N             : out   std_logic_vector(6 downto 0);
        --HEX2_N             : out   std_logic_vector(6 downto 0);
        --HEX3_N             : out   std_logic_vector(6 downto 0);
        --HEX4_N             : out   std_logic_vector(6 downto 0);
        --HEX5_N             : out   std_logic_vector(6 downto 0);

        ---- IR
        --IRDA_RXD           : in    std_logic;
        --IRDA_TXD           : out   std_logic;

        ---- KEY_N
        --KEY_N              : in    std_logic_vector(3 downto 0);

        ---- LED
        --LEDR               : out   std_logic_vector(9 downto 0);

        ---- PS2
        --PS2_CLK            : inout std_logic;
        --PS2_CLK2           : inout std_logic;
        --PS2_DAT            : inout std_logic;
        --PS2_DAT2           : inout std_logic;

        ---- SW
        --SW                 : in    std_logic_vector(9 downto 0);

        ---- Video-In
        --TD_CLK27           : inout std_logic;
        --TD_DATA            : out   std_logic_vector(7 downto 0);
        --TD_HS              : out   std_logic;
        --TD_RESET_N         : out   std_logic;
        --TD_VS              : out   std_logic;

        ---- VGA
        --VGA_B              : out   std_logic_vector(7 downto 0);
        --VGA_BLANK_N        : out   std_logic;
        --VGA_CLK            : out   std_logic;
        --VGA_G              : out   std_logic_vector(7 downto 0);
        --VGA_HS             : out   std_logic;
        --VGA_R              : out   std_logic_vector(7 downto 0);
        --VGA_SYNC_N         : out   std_logic;
        --VGA_VS             : out   std_logic;

        -- GPIO_0
        GPIO_0_D5M_D       : in    std_logic_vector(11 downto 0);
        GPIO_0_D5M_FVAL    : in    std_logic;
        GPIO_0_D5M_LVAL    : in    std_logic;
        GPIO_0_D5M_PIXCLK  : in    std_logic;
        GPIO_0_D5M_RESET_N : out   std_logic;
        GPIO_0_D5M_SCLK    : inout std_logic;
        GPIO_0_D5M_SDATA   : inout std_logic;
        GPIO_0_D5M_STROBE  : in    std_logic;
        GPIO_0_D5M_TRIGGER : out   std_logic;
        GPIO_0_D5M_XCLKIN  : out   std_logic

        ---- GPIO_1
        --GPIO_1             : inout std_logic_vector(35 downto 0);

        ---- HPS
        --HPS_CONV_USB_N     : inout std_logic;
        --HPS_DDR3_ADDR      : out   std_logic_vector(14 downto 0);
        --HPS_DDR3_BA        : out   std_logic_vector(2 downto 0);
        --HPS_DDR3_CAS_N     : out   std_logic;
        --HPS_DDR3_CK_N      : out   std_logic;
        --HPS_DDR3_CK_P      : out   std_logic;
        --HPS_DDR3_CKE       : out   std_logic;
        --HPS_DDR3_CS_N      : out   std_logic;
        --HPS_DDR3_DM        : out   std_logic_vector(3 downto 0);
        --HPS_DDR3_DQ        : inout std_logic_vector(31 downto 0);
        --HPS_DDR3_DQS_N     : inout std_logic_vector(3 downto 0);
        --HPS_DDR3_DQS_P     : inout std_logic_vector(3 downto 0);
        --HPS_DDR3_ODT       : out   std_logic;
        --HPS_DDR3_RAS_N     : out   std_logic;
        --HPS_DDR3_RESET_N   : out   std_logic;
        --HPS_DDR3_RZQ       : in    std_logic;
        --HPS_DDR3_WE_N      : out   std_logic;
        --HPS_ENET_GTX_CLK   : out   std_logic;
        --HPS_ENET_INT_N     : inout std_logic;
        --HPS_ENET_MDC       : out   std_logic;
        --HPS_ENET_MDIO      : inout std_logic;
        --HPS_ENET_RX_CLK    : in    std_logic;
        --HPS_ENET_RX_DATA   : in    std_logic_vector(3 downto 0);
        --HPS_ENET_RX_DV     : in    std_logic;
        --HPS_ENET_TX_DATA   : out   std_logic_vector(3 downto 0);
        --HPS_ENET_TX_EN     : out   std_logic;
        --HPS_FLASH_DATA     : inout std_logic_vector(3 downto 0);
        --HPS_FLASH_DCLK     : out   std_logic;
        --HPS_FLASH_NCSO     : out   std_logic;
        --HPS_GSENSOR_INT    : inout std_logic;
        --HPS_I2C_CONTROL    : inout std_logic;
        --HPS_I2C1_SCLK      : inout std_logic;
        --HPS_I2C1_SDAT      : inout std_logic;
        --HPS_I2C2_SCLK      : inout std_logic;
        --HPS_I2C2_SDAT      : inout std_logic;
        --HPS_KEY_N          : inout std_logic;
        --HPS_LED            : inout std_logic;
        --HPS_LTC_GPIO       : inout std_logic;
        --HPS_SD_CLK         : out   std_logic;
        --HPS_SD_CMD         : inout std_logic;
        --HPS_SD_DATA        : inout std_logic_vector(3 downto 0);
        --HPS_SPIM_CLK       : out   std_logic;
        --HPS_SPIM_MISO      : in    std_logic;
        --HPS_SPIM_MOSI      : out   std_logic;
        --HPS_SPIM_SS        : inout std_logic;
        --HPS_UART_RX        : in    std_logic;
        --HPS_UART_TX        : out   std_logic;
        --HPS_USB_CLKOUT     : in    std_logic;
        --HPS_USB_DATA       : inout std_logic_vector(7 downto 0);
        --HPS_USB_DIR        : in    std_logic;
        --HPS_USB_NXT        : in    std_logic;
        --HPS_USB_STP        : out   std_logic
    );
end entity DE1_SoC_TRDB_D5M_top_level;

architecture rtl of DE1_SoC_TRDB_D5M_top_level is

    component system is
        port(
            clk_clk                          : in    std_logic                     := 'X';
            reset_reset_n                    : in    std_logic                     := 'X';
            sdram_clk_clk                    : out   std_logic;
            sdram_controller_addr            : out   std_logic_vector(12 downto 0);
            sdram_controller_ba              : out   std_logic_vector(1 downto 0);
            sdram_controller_cas_n           : out   std_logic;
            sdram_controller_cke             : out   std_logic;
            sdram_controller_cs_n            : out   std_logic;
            sdram_controller_dq              : inout std_logic_vector(15 downto 0) := (others => 'X');
            sdram_controller_dqm             : out   std_logic_vector(1 downto 0);
            sdram_controller_ras_n           : out   std_logic;
            sdram_controller_we_n            : out   std_logic;
            trdb_d5m_xclkin_clk              : out   std_logic;
            trdb_d5m_cmos_sensor_frame_valid : in    std_logic                     := 'X';
            trdb_d5m_cmos_sensor_line_valid  : in    std_logic                     := 'X';
            trdb_d5m_cmos_sensor_data        : in    std_logic_vector(11 downto 0) := (others => 'X');
            trdb_d5m_i2c_scl                 : inout std_logic                     := 'X';
            trdb_d5m_i2c_sda                 : inout std_logic                     := 'X';
            trdb_d5m_pixclk_clk              : in    std_logic                     := 'X'
        );
    end component system;

begin
    GPIO_0_D5M_RESET_N <= '1';
    GPIO_0_D5M_TRIGGER <= '0';

    system_inst : component system
        port map(
            clk_clk                          => CLOCK_50,
            reset_reset_n                    => '1',
            sdram_clk_clk                    => DRAM_CLK,
            sdram_controller_addr            => DRAM_ADDR,
            sdram_controller_ba              => DRAM_BA,
            sdram_controller_cas_n           => DRAM_CAS_N,
            sdram_controller_cke             => DRAM_CKE,
            sdram_controller_cs_n            => DRAM_CS_N,
            sdram_controller_dq              => DRAM_DQ,
            sdram_controller_dqm(1)          => DRAM_UDQM,
            sdram_controller_dqm(0)          => DRAM_LDQM,
            sdram_controller_ras_n           => DRAM_RAS_N,
            sdram_controller_we_n            => DRAM_WE_N,
            trdb_d5m_xclkin_clk              => GPIO_0_D5M_XCLKIN,
            trdb_d5m_cmos_sensor_frame_valid => GPIO_0_D5M_FVAL,
            trdb_d5m_cmos_sensor_line_valid  => GPIO_0_D5M_LVAL,
            trdb_d5m_cmos_sensor_data        => GPIO_0_D5M_D,
            trdb_d5m_i2c_scl                 => GPIO_0_D5M_SCLK,
            trdb_d5m_i2c_sda                 => GPIO_0_D5M_SDATA,
            trdb_d5m_pixclk_clk              => GPIO_0_D5M_PIXCLK
        );

end;
