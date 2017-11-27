module	TOP(
	input	clk,
	input	DRY,
	input	ovr_in,
	input	signed	[13:0]	AD,
    input   rx_ready,           //单片机拉高时，FIFO开始工作
    output  tx_ready,           //拉低时，单片机才能准备接收数据(只检测一次)
	output	ad_clk,
    output  tx
);
wire    clk_100;

wire    signed  [13:0]  s_axis_data_tdata;      //输入处理的数据
//wire    s_axis_config_tready;           //IP Core准备接收配置信号
//wire    s_axis_data_tready;             //IP Core准备接收数据信号
wire    signed  [31:0]  data_out_re;
wire    signed  [31:0]  data_out_im;
wire    m_axis_data_tvalid;             //输出数据有效信号
wire    [15:0]  m_axis_data_tuser;      //输出数据计数

wire    uart_en;                        //串口使能信号
wire    rd_clk;                         //FIFO读信号
wire    signed  [31:0]  data_uart;

wire	ovr_out;
assign	ad_clk = clk_100;

//----------------调用IP核------------------//
PLL             PLL_inst0(
  .clk_out1     (clk_100),
  .clk_in1      (clk)
);
//-----------------------------------------//
//test_wave       test_wave_inst1(
//    .sclk       (clk_100),
//    .data_out   (s_axis_data_tdata)
//);
//-----------------------------------------//
AD              AD_inst1(
	.clk        (clk_100),
	.DRY        (DRY),
	.ovr_in     (ovr_in),
	.ad_in      (AD),
	.ad_out     (s_axis_data_tdata),
	.ovr_out    (ovr_out)
);
//-----------------------------------------//
FFT_Control                 FFT_Control_inst2(
    .clk                    (clk_100),
    .s_axis_data_tdata      ({{18{s_axis_data_tdata[13]}},s_axis_data_tdata}),      
//    .s_axis_config_tready   (s_axis_config_tready),           
//    .s_axis_data_tready     (s_axis_data_tready),
    .data_out_re            (data_out_re), 
    .data_out_im            (data_out_im),
    .m_axis_data_tvalid     (m_axis_data_tvalid),
    .m_axis_data_tuser      (m_axis_data_tuser) 
);
//-----------------------------------------//
FIFO_Control        FIFO_Control_inst3(
    .clk            (clk_100),
    .wr_clk         (clk_100),
    .rd_clk         (rd_clk), 
    .data_valid     (m_axis_data_tvalid),
    .rx_ready       (rx_ready), 
    .data_re        (data_out_re),

    .tx_ready       (tx_ready),
    .uart_en        (uart_en),
	.data_out       (data_uart)
);
//-----------------------------------------//
uart_tx         uart_tx_inst5(
	.clk        (clk_100),
	.data       (data_uart),
	.uart_en    (uart_en),
	.rd_clk     (rd_clk),
	.tx         (tx)
);
//-----------------------------------------//


endmodule 
