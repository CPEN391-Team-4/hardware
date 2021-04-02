
module system (
	clk_clk,
	reset_reset_n,
	sdram_clk_clk,
	sdram_controller_addr,
	sdram_controller_ba,
	sdram_controller_cas_n,
	sdram_controller_cke,
	sdram_controller_cs_n,
	sdram_controller_dq,
	sdram_controller_dqm,
	sdram_controller_ras_n,
	sdram_controller_we_n,
	trdb_d5m_cmos_sensor_frame_valid,
	trdb_d5m_cmos_sensor_line_valid,
	trdb_d5m_cmos_sensor_data,
	trdb_d5m_i2c_scl,
	trdb_d5m_i2c_sda,
	trdb_d5m_pixclk_clk,
	trdb_d5m_xclkin_clk);	

	input		clk_clk;
	input		reset_reset_n;
	output		sdram_clk_clk;
	output	[12:0]	sdram_controller_addr;
	output	[1:0]	sdram_controller_ba;
	output		sdram_controller_cas_n;
	output		sdram_controller_cke;
	output		sdram_controller_cs_n;
	inout	[15:0]	sdram_controller_dq;
	output	[1:0]	sdram_controller_dqm;
	output		sdram_controller_ras_n;
	output		sdram_controller_we_n;
	input		trdb_d5m_cmos_sensor_frame_valid;
	input		trdb_d5m_cmos_sensor_line_valid;
	input	[11:0]	trdb_d5m_cmos_sensor_data;
	inout		trdb_d5m_i2c_scl;
	inout		trdb_d5m_i2c_sda;
	input		trdb_d5m_pixclk_clk;
	output		trdb_d5m_xclkin_clk;
endmodule
