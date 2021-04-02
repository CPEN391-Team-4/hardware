	system u0 (
		.clk_clk                          (<connected-to-clk_clk>),                          //                  clk.clk
		.reset_reset_n                    (<connected-to-reset_reset_n>),                    //                reset.reset_n
		.sdram_clk_clk                    (<connected-to-sdram_clk_clk>),                    //            sdram_clk.clk
		.sdram_controller_addr            (<connected-to-sdram_controller_addr>),            //     sdram_controller.addr
		.sdram_controller_ba              (<connected-to-sdram_controller_ba>),              //                     .ba
		.sdram_controller_cas_n           (<connected-to-sdram_controller_cas_n>),           //                     .cas_n
		.sdram_controller_cke             (<connected-to-sdram_controller_cke>),             //                     .cke
		.sdram_controller_cs_n            (<connected-to-sdram_controller_cs_n>),            //                     .cs_n
		.sdram_controller_dq              (<connected-to-sdram_controller_dq>),              //                     .dq
		.sdram_controller_dqm             (<connected-to-sdram_controller_dqm>),             //                     .dqm
		.sdram_controller_ras_n           (<connected-to-sdram_controller_ras_n>),           //                     .ras_n
		.sdram_controller_we_n            (<connected-to-sdram_controller_we_n>),            //                     .we_n
		.trdb_d5m_cmos_sensor_frame_valid (<connected-to-trdb_d5m_cmos_sensor_frame_valid>), // trdb_d5m_cmos_sensor.frame_valid
		.trdb_d5m_cmos_sensor_line_valid  (<connected-to-trdb_d5m_cmos_sensor_line_valid>),  //                     .line_valid
		.trdb_d5m_cmos_sensor_data        (<connected-to-trdb_d5m_cmos_sensor_data>),        //                     .data
		.trdb_d5m_i2c_scl                 (<connected-to-trdb_d5m_i2c_scl>),                 //         trdb_d5m_i2c.scl
		.trdb_d5m_i2c_sda                 (<connected-to-trdb_d5m_i2c_sda>),                 //                     .sda
		.trdb_d5m_pixclk_clk              (<connected-to-trdb_d5m_pixclk_clk>),              //      trdb_d5m_pixclk.clk
		.trdb_d5m_xclkin_clk              (<connected-to-trdb_d5m_xclkin_clk>)               //      trdb_d5m_xclkin.clk
	);

