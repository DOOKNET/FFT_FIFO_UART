`timescale	1ns/1ps

module	tb_uart();

reg 	[31:0]	data = 32'b10101010_01010101_10101010_01010101;		//0001_0010_0011_0001_0010_0011_0001_0010		h12312312
reg		sclk;
reg		uart_en;

wire	wr_clk;
wire 	tx;
//---------------------------//
initial		sclk = 1;
always	#5	sclk = ~sclk;
//---------------------------//
initial		uart_en = 1;
always	begin
	#1700000
	uart_en = 0;

end


uart_tx			uart_tx_inst(
	.clk		(sclk),
	.data		(data),
	.uart_en	(uart_en),
	.wr_clk		(wr_clk),
	.tx			(tx)
);



endmodule
