module	AD(
	input		clk,		//100M系统时钟
	input		DRY,		//AD反馈时钟	
	input		ovr_in,		//AD电压超量程标识
	input		signed	[13:0]	ad_in,
	output		signed	[13:0]	ad_out,
	output		ovr_out
);

reg	signed	[13:0]	ad_reg2;
reg	signed	[13:0]	ad_reg3;
always @(posedge clk) begin
	ad_reg2 <= ad_in;
	ad_reg3 <= ad_reg2;
end

assign	ad_out = ad_reg3;


endmodule
