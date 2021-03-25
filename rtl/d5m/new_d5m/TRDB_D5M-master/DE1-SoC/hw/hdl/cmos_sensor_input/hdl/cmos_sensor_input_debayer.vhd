library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.cmos_sensor_input_constants.all;

entity cmos_sensor_input_debayer is
    generic(
        PIX_DEPTH_RAW : positive;
        PIX_DEPTH_RGB : positive;
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
        data_out           : out std_logic_vector(PIX_DEPTH_RGB - 1 downto 0);
        start_of_frame_out : out std_logic;
        end_of_frame_out   : out std_logic
    );
end entity cmos_sensor_input_debayer;

architecture rtl of cmos_sensor_input_debayer is

    constant column_width : unsigned(10 downto 0) := to_unsigned(1280, 11);
	 constant zero11bit : unsigned(10 downto 0) := to_unsigned(0, 11);

    signal mdata_0, mdata_1									  : std_logic_vector(PIX_DEPTH_RAW - 1 downto 0);
	 signal udata_0, udata_1, udatad_0, udatad_1, uR, uB : unsigned(PIX_DEPTH_RAW - 1 downto 0);
    signal lumen                                        : unsigned(PIX_DEPTH_RAW + 1 downto 0);
	 signal uG                                           : unsigned(PIX_DEPTH_RAW downto 0);
    signal dval                                         : std_logic;

begin

    -- line_buffer instantiation
    lbuf  : entity work.line_buffer(SYN)
            port map (
                clken => valid_in,
                clock => clk,
                shiftin => data_in,
                shiftout => open,
                taps0x => mdata_1,
                taps1x => mdata_0
            );

	 lumen <= resize(uR, 14) + uB + uG(PIX_DEPTH_RAW downto 1);
    data_out <= std_logic_vector(lumen(PIX_DEPTH_RAW + 1 downto PIX_DEPTH_RAW - PIX_DEPTH_RGB + 2));
    end_of_frame_out <= end_of_frame_in;    -- Check if this works correctly
	 udata_0 <= unsigned(mdata_0);
	 udata_1 <= unsigned(mdata_1);
	 

    process (clk, reset)
	 
	 variable xcont : unsigned(10 downto 0);
    variable ycont : unsigned(10 downto 0);
	 
    begin
        if reset = '1' then
            uR                  <= to_unsigned(0, PIX_DEPTH_RAW);
            uG                  <= to_unsigned(0, PIX_DEPTH_RAW);
            uB                  <= to_unsigned(0, PIX_DEPTH_RAW);
            udatad_0            <= to_unsigned(0, PIX_DEPTH_RAW);
            udatad_1            <= to_unsigned(0, PIX_DEPTH_RAW);
            dval                <= '0';
            start_of_frame_out  <= '0';
            end_of_frame_out    <= '0';

            xcont               := to_unsigned(0, 11);
            ycont               := to_unsigned(0, 11);

        elsif rising_edge(clk) then
            -- x,y frame coordinate counter
            if valid_in = '1' then
                if xcont < column_width - to_unsigned(1, 11) then
                    xcont := xcont + to_unsigned(1, 11);
                else
                    xcont := to_unsigned(0, 11);
                    ycont := ycont + to_unsigned(1, 11);
                end if;
            end if;

            -- check if start of frame
            if xcont = to_unsigned(1, 11) and ycont = to_unsigned(1, 11) then
                start_of_frame_out <= '1';
            else
                start_of_frame_out <= '0';
            end if;

            udatad_0 <= udata_0;
            udatad_1 <= udata_1;

            -- Check if data valid
            if ycont(0) = '1' or xcont(0) = '1' then
                valid_out <= '0';
            else
                valid_out <= valid_in;
            end if;

            -- RGB calculation
            if ycont(0) = '1' and xcont(0) = '0' then
                uR <= udata_0;
                uG <= udatad_0 + udata_1;
                uB <= udatad_1;
            elsif ycont(0) = '1' and xcont(0) = '1' then
                uR <= udatad_0;
                uG <= udata_0 + udatad_1;
                uB <= udata_1;
            elsif ycont(0) = '0' and xcont(0) = '0' then
                uR <= udata_1;
                uG <= udata_0 + udatad_1;
                uB <= udatad_0;
            elsif ycont(0) = '0' and xcont(0) = '1' then
                uR <= udatad_1;
                uG <= udatad_0 + udata_1;
                uB <= udata_0;
            end if;
        end if;
    end process;

end architecture rtl;