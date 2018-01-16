`timescale	1ns/1ps
module	tb_TOP();

reg 	sclk;
reg		rx_ready = 0;
wire 	tx_ready;
wire	tx;
//wire	[13:0]	s_axis_data_tdata;
//wire	[13:0]	data_out_re;
//wire	[13:0]	data_out_im;
//wire	m_axis_data_tvalid;
//wire	m_axis_data_tuser;
//wire	clk_100;


//---------时钟--------------//
initial	sclk = 0;
always	#10	sclk = ~sclk;
//--------------------------//
//initial	rx_ready = 0;

//----------例化-----------//

TOP				TOP_inst0(
	.clk 		(sclk),
    .rx_ready	(rx_ready),
    .tx_ready	(tx_ready),  
    .tx			(tx)
);
/*
PLL             PLL_inst0(
  .clk_out1     (clk_100),
  .clk_in1      (sclk)
);
test_wave       test_wave_inst1(
    .sclk       (clk_100),
    .data_out   (s_axis_data_tdata)
);
FFT_Control				FFT_Control_inst2(
    .clk				(clk_100),
    .s_axis_data_tdata	({{18{s_axis_data_tdata[13]}},s_axis_data_tdata}),      //输入处理的数据
    .data_out_re		(data_out_re),    
    .data_out_im		(data_out_im),    
    .m_axis_data_tvalid	(m_axis_data_tvalid),             //输出数据有效信号
    .m_axis_data_tuser	(m_axis_data_tuser)       //输出数据计数
);
*/



endmodule

