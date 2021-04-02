	component trdb_d5m is
		port (
			clk_sys_clk                                         : in    std_logic                     := 'X';             -- clk
			clk_trdb_d5m_pixclk_clk                             : in    std_logic                     := 'X';             -- clk
			cmos_sensor_acquisition_0_cmos_sensor_input_irq_irq : out   std_logic;                                        -- irq
			i2c_scl                                             : inout std_logic                     := 'X';             -- scl
			i2c_sda                                             : inout std_logic                     := 'X';             -- sda
			i2c_interrupt_sender_irq                            : out   std_logic;                                        -- irq
			master_address                                      : out   std_logic_vector(31 downto 0);                    -- address
			master_write                                        : out   std_logic;                                        -- write
			master_byteenable                                   : out   std_logic_vector(3 downto 0);                     -- byteenable
			master_writedata                                    : out   std_logic_vector(31 downto 0);                    -- writedata
			master_waitrequest                                  : in    std_logic                     := 'X';             -- waitrequest
			master_burstcount                                   : out   std_logic_vector(4 downto 0);                     -- burstcount
			msgdma_csr_irq_irq                                  : out   std_logic;                                        -- irq
			reset_reset_n                                       : in    std_logic                     := 'X';             -- reset_n
			slave_waitrequest                                   : out   std_logic;                                        -- waitrequest
			slave_readdata                                      : out   std_logic_vector(31 downto 0);                    -- readdata
			slave_readdatavalid                                 : out   std_logic;                                        -- readdatavalid
			slave_burstcount                                    : in    std_logic_vector(0 downto 0)  := (others => 'X'); -- burstcount
			slave_writedata                                     : in    std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			slave_address                                       : in    std_logic_vector(6 downto 0)  := (others => 'X'); -- address
			slave_write                                         : in    std_logic                     := 'X';             -- write
			slave_read                                          : in    std_logic                     := 'X';             -- read
			slave_byteenable                                    : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			slave_debugaccess                                   : in    std_logic                     := 'X';             -- debugaccess
			trdb_d5m_d_frame_valid                              : in    std_logic                     := 'X';             -- frame_valid
			trdb_d5m_d_line_valid                               : in    std_logic                     := 'X';             -- line_valid
			trdb_d5m_d_data                                     : in    std_logic_vector(11 downto 0) := (others => 'X')  -- data
		);
	end component trdb_d5m;

	u0 : component trdb_d5m
		port map (
			clk_sys_clk                                         => CONNECTED_TO_clk_sys_clk,                                         --                                         clk_sys.clk
			clk_trdb_d5m_pixclk_clk                             => CONNECTED_TO_clk_trdb_d5m_pixclk_clk,                             --                             clk_trdb_d5m_pixclk.clk
			cmos_sensor_acquisition_0_cmos_sensor_input_irq_irq => CONNECTED_TO_cmos_sensor_acquisition_0_cmos_sensor_input_irq_irq, -- cmos_sensor_acquisition_0_cmos_sensor_input_irq.irq
			i2c_scl                                             => CONNECTED_TO_i2c_scl,                                             --                                             i2c.scl
			i2c_sda                                             => CONNECTED_TO_i2c_sda,                                             --                                                .sda
			i2c_interrupt_sender_irq                            => CONNECTED_TO_i2c_interrupt_sender_irq,                            --                            i2c_interrupt_sender.irq
			master_address                                      => CONNECTED_TO_master_address,                                      --                                          master.address
			master_write                                        => CONNECTED_TO_master_write,                                        --                                                .write
			master_byteenable                                   => CONNECTED_TO_master_byteenable,                                   --                                                .byteenable
			master_writedata                                    => CONNECTED_TO_master_writedata,                                    --                                                .writedata
			master_waitrequest                                  => CONNECTED_TO_master_waitrequest,                                  --                                                .waitrequest
			master_burstcount                                   => CONNECTED_TO_master_burstcount,                                   --                                                .burstcount
			msgdma_csr_irq_irq                                  => CONNECTED_TO_msgdma_csr_irq_irq,                                  --                                  msgdma_csr_irq.irq
			reset_reset_n                                       => CONNECTED_TO_reset_reset_n,                                       --                                           reset.reset_n
			slave_waitrequest                                   => CONNECTED_TO_slave_waitrequest,                                   --                                           slave.waitrequest
			slave_readdata                                      => CONNECTED_TO_slave_readdata,                                      --                                                .readdata
			slave_readdatavalid                                 => CONNECTED_TO_slave_readdatavalid,                                 --                                                .readdatavalid
			slave_burstcount                                    => CONNECTED_TO_slave_burstcount,                                    --                                                .burstcount
			slave_writedata                                     => CONNECTED_TO_slave_writedata,                                     --                                                .writedata
			slave_address                                       => CONNECTED_TO_slave_address,                                       --                                                .address
			slave_write                                         => CONNECTED_TO_slave_write,                                         --                                                .write
			slave_read                                          => CONNECTED_TO_slave_read,                                          --                                                .read
			slave_byteenable                                    => CONNECTED_TO_slave_byteenable,                                    --                                                .byteenable
			slave_debugaccess                                   => CONNECTED_TO_slave_debugaccess,                                   --                                                .debugaccess
			trdb_d5m_d_frame_valid                              => CONNECTED_TO_trdb_d5m_d_frame_valid,                              --                                      trdb_d5m_d.frame_valid
			trdb_d5m_d_line_valid                               => CONNECTED_TO_trdb_d5m_d_line_valid,                               --                                                .line_valid
			trdb_d5m_d_data                                     => CONNECTED_TO_trdb_d5m_d_data                                      --                                                .data
		);

