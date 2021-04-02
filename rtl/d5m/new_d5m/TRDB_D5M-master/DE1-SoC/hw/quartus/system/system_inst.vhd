	component system is
		port (
			clk_clk                          : in    std_logic                     := 'X';             -- clk
			reset_reset_n                    : in    std_logic                     := 'X';             -- reset_n
			sdram_clk_clk                    : out   std_logic;                                        -- clk
			sdram_controller_addr            : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_controller_ba              : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_controller_cas_n           : out   std_logic;                                        -- cas_n
			sdram_controller_cke             : out   std_logic;                                        -- cke
			sdram_controller_cs_n            : out   std_logic;                                        -- cs_n
			sdram_controller_dq              : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
			sdram_controller_dqm             : out   std_logic_vector(1 downto 0);                     -- dqm
			sdram_controller_ras_n           : out   std_logic;                                        -- ras_n
			sdram_controller_we_n            : out   std_logic;                                        -- we_n
			trdb_d5m_cmos_sensor_frame_valid : in    std_logic                     := 'X';             -- frame_valid
			trdb_d5m_cmos_sensor_line_valid  : in    std_logic                     := 'X';             -- line_valid
			trdb_d5m_cmos_sensor_data        : in    std_logic_vector(11 downto 0) := (others => 'X'); -- data
			trdb_d5m_i2c_scl                 : inout std_logic                     := 'X';             -- scl
			trdb_d5m_i2c_sda                 : inout std_logic                     := 'X';             -- sda
			trdb_d5m_pixclk_clk              : in    std_logic                     := 'X';             -- clk
			trdb_d5m_xclkin_clk              : out   std_logic                                         -- clk
		);
	end component system;

	u0 : component system
		port map (
			clk_clk                          => CONNECTED_TO_clk_clk,                          --                  clk.clk
			reset_reset_n                    => CONNECTED_TO_reset_reset_n,                    --                reset.reset_n
			sdram_clk_clk                    => CONNECTED_TO_sdram_clk_clk,                    --            sdram_clk.clk
			sdram_controller_addr            => CONNECTED_TO_sdram_controller_addr,            --     sdram_controller.addr
			sdram_controller_ba              => CONNECTED_TO_sdram_controller_ba,              --                     .ba
			sdram_controller_cas_n           => CONNECTED_TO_sdram_controller_cas_n,           --                     .cas_n
			sdram_controller_cke             => CONNECTED_TO_sdram_controller_cke,             --                     .cke
			sdram_controller_cs_n            => CONNECTED_TO_sdram_controller_cs_n,            --                     .cs_n
			sdram_controller_dq              => CONNECTED_TO_sdram_controller_dq,              --                     .dq
			sdram_controller_dqm             => CONNECTED_TO_sdram_controller_dqm,             --                     .dqm
			sdram_controller_ras_n           => CONNECTED_TO_sdram_controller_ras_n,           --                     .ras_n
			sdram_controller_we_n            => CONNECTED_TO_sdram_controller_we_n,            --                     .we_n
			trdb_d5m_cmos_sensor_frame_valid => CONNECTED_TO_trdb_d5m_cmos_sensor_frame_valid, -- trdb_d5m_cmos_sensor.frame_valid
			trdb_d5m_cmos_sensor_line_valid  => CONNECTED_TO_trdb_d5m_cmos_sensor_line_valid,  --                     .line_valid
			trdb_d5m_cmos_sensor_data        => CONNECTED_TO_trdb_d5m_cmos_sensor_data,        --                     .data
			trdb_d5m_i2c_scl                 => CONNECTED_TO_trdb_d5m_i2c_scl,                 --         trdb_d5m_i2c.scl
			trdb_d5m_i2c_sda                 => CONNECTED_TO_trdb_d5m_i2c_sda,                 --                     .sda
			trdb_d5m_pixclk_clk              => CONNECTED_TO_trdb_d5m_pixclk_clk,              --      trdb_d5m_pixclk.clk
			trdb_d5m_xclkin_clk              => CONNECTED_TO_trdb_d5m_xclkin_clk               --      trdb_d5m_xclkin.clk
		);

