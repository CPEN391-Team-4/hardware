library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.numeric_bit.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_unsigned.all;

use work.cmos_sensor_input_constants.all;

entity cmos_sensor_input_grey is
    generic(
        PIX_DEPTH_RAW : positive;
        PIX_DEPTH_GREY : positive;
        MAX_WIDTH     : positive
    );
    port(
        clk                : in  std_logic;
        reset              : in  std_logic;

        -- avalon_mm_slave
        stop_and_reset     : in  std_logic;
        debayer_pattern    : in  std_logic_vector(CMOS_SENSOR_INPUT_CONFIG_DEBAYER_PATTERN_WIDTH - 1 downto 0);

        -- sampler
        valid_in           : in  std_logic;
        data_in            : in  std_logic_vector(PIX_DEPTH_RAW - 1 downto 0);
        start_of_frame_in  : in  std_logic;
        end_of_frame_in    : in  std_logic;

        -- packer / fifo
        valid_out          : out std_logic;
        data_out           : out std_logic_vector(PIX_DEPTH_GREY - 1 downto 0);
        start_of_frame_out : out std_logic;
        end_of_frame_out   : out std_logic
    );
end entity cmos_sensor_input_grey;

architecture rtl of cmos_sensor_input_grey is

    variable x_cont : std_logic_vector(PIX_DEPTH_RAW - 2 downto 0);
    variable y_cont : std_logic_vector(PIX_DEPTH_RAW - 2 downto 0);

    const column_width : positive := 1280;

    signal mdata_0, mdata_1, mdatad_0, mdatad_1, mR, mB : std_logic_vector(PIX_DEPTH_RAW - 1 downto 0);
    signal lumen                                        : std_logic_vector(PIX_DEPTH_RAW + 1 downto 0);
    signal mG                                           : std_logic_vector(PIX_DEPTH_RAW downto 0);
    signal dval                                         : std_logic;

begin
    -- line_buffer instantiation
    -- line_buffer instantiation
    -- line_buffer instantiation
    -- line_buffer instantiation

    lumen <= mR + mB + mG(PIX_DEPTH_RAW downto 1);
    data_out <= lumen(PIX_DEPTH_RAW + 1 downto PIX_DEPTH_RAW - PIX_DEPTH_GREY + 2);
    end_of_frame_out <= end_of_frame_in;

    process (clk, reset)
    begin
        if reset = '1' then
            mR                  <= '0';
            mG                  <= '0';
            mB                  <= '0';
            mdatad_0            <= '0';
            mdatad_1            <= '0';
            dval                <= '0';
            start_of_frame_out  <= '0';
            end_of_frame_out    <= '0';

            xcont               := '0';
            ycont               := '0';

        elsif rising_edge(clk) then
            -- x,y frame coordinate counter
            if valid_in = '1' then
                if xcont < column_width - '1' then
                    xcont <= xcont + '1';
                else
                    xcont <= '0';
                    ycont <= ycont + '1';
                end if;
            end if;

            -- check if start of frame
            if xcont = '1' and ycont = '1' then
                start_of_frame_out <= '1';
            else
                start_of_frame_out <= '0';
            end if;

            mdatad_0 <= mdata_0;
            mdata_1 <= mdata_1;

            -- Check if data valid
            if ycont(0) = '1' or xcont(0) = '1' then
                valid_out <= '0';
            else
                valid_out <= valid_in;
            end if;

            -- RGB calculation
            if ycont(0) = '1' and xcont(0) = '0' then
                mR <= mdata_0;
                mG <= mdatad_0 + mdata_1;
                mB <= mdatad_1;
            elsif ycont(0) = '1' and xcont(0) = '1' then
                mR <= mdatad_0;
                mG <= mdata_0 + mdatad_1;
                mB <= mdata_1;
            elsif ycont(0) = '0' and xcont(0) = '0' then
                mR <= mdata_1;
                mG <= mdata_0 + mdatad_1;
                mB <= mdatad_0;
            elsif ycont(0) = '0' and xcont(0) = '1' then
                mR <= mdatad_1;
                mG <= mdatad_0 + mdata_1;
                mB <= mdata_0;
            end if;
        end if;
    end process;

end architecture rtl;