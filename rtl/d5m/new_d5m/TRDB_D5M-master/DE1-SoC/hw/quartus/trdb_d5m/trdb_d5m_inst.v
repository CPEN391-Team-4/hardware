	trdb_d5m u0 (
		.clk_sys_clk                                         (<connected-to-clk_sys_clk>),                                         //                                         clk_sys.clk
		.clk_trdb_d5m_pixclk_clk                             (<connected-to-clk_trdb_d5m_pixclk_clk>),                             //                             clk_trdb_d5m_pixclk.clk
		.cmos_sensor_acquisition_0_cmos_sensor_input_irq_irq (<connected-to-cmos_sensor_acquisition_0_cmos_sensor_input_irq_irq>), // cmos_sensor_acquisition_0_cmos_sensor_input_irq.irq
		.i2c_scl                                             (<connected-to-i2c_scl>),                                             //                                             i2c.scl
		.i2c_sda                                             (<connected-to-i2c_sda>),                                             //                                                .sda
		.i2c_interrupt_sender_irq                            (<connected-to-i2c_interrupt_sender_irq>),                            //                            i2c_interrupt_sender.irq
		.master_address                                      (<connected-to-master_address>),                                      //                                          master.address
		.master_write                                        (<connected-to-master_write>),                                        //                                                .write
		.master_byteenable                                   (<connected-to-master_byteenable>),                                   //                                                .byteenable
		.master_writedata                                    (<connected-to-master_writedata>),                                    //                                                .writedata
		.master_waitrequest                                  (<connected-to-master_waitrequest>),                                  //                                                .waitrequest
		.master_burstcount                                   (<connected-to-master_burstcount>),                                   //                                                .burstcount
		.msgdma_csr_irq_irq                                  (<connected-to-msgdma_csr_irq_irq>),                                  //                                  msgdma_csr_irq.irq
		.reset_reset_n                                       (<connected-to-reset_reset_n>),                                       //                                           reset.reset_n
		.slave_waitrequest                                   (<connected-to-slave_waitrequest>),                                   //                                           slave.waitrequest
		.slave_readdata                                      (<connected-to-slave_readdata>),                                      //                                                .readdata
		.slave_readdatavalid                                 (<connected-to-slave_readdatavalid>),                                 //                                                .readdatavalid
		.slave_burstcount                                    (<connected-to-slave_burstcount>),                                    //                                                .burstcount
		.slave_writedata                                     (<connected-to-slave_writedata>),                                     //                                                .writedata
		.slave_address                                       (<connected-to-slave_address>),                                       //                                                .address
		.slave_write                                         (<connected-to-slave_write>),                                         //                                                .write
		.slave_read                                          (<connected-to-slave_read>),                                          //                                                .read
		.slave_byteenable                                    (<connected-to-slave_byteenable>),                                    //                                                .byteenable
		.slave_debugaccess                                   (<connected-to-slave_debugaccess>),                                   //                                                .debugaccess
		.trdb_d5m_d_frame_valid                              (<connected-to-trdb_d5m_d_frame_valid>),                              //                                      trdb_d5m_d.frame_valid
		.trdb_d5m_d_line_valid                               (<connected-to-trdb_d5m_d_line_valid>),                               //                                                .line_valid
		.trdb_d5m_d_data                                     (<connected-to-trdb_d5m_d_data>)                                      //                                                .data
	);

