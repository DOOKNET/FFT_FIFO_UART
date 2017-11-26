module uart_tx(
	input	clk,
	input	signed	[31:0]	data,
	input	uart_en,
	output	rd_clk,
	output	tx
);

parameter	BPS = 10'd868;		//波特率为115200
parameter 	BPS_2 = 10'd434;	//波特率为921600时的分频计数值的一半，用于数据采样;在数据的中间点时刻采样，数据最稳定


//-----------------波特率计数--------------------//
reg		[9:0]	cnt = 9'd0;
reg		clk_bps = 0;

always @(posedge clk) begin
	if(cnt == BPS)	begin
		cnt <= 0;
	end
	else	begin
		cnt <= cnt + 1;
	end
end
always @(posedge clk) begin
	if(cnt == BPS_2)	begin
		clk_bps <= 1;
	end
	else	begin
		clk_bps <= 0;
	end
end
//----------------------------------------------//
reg		uart_tx = 1;			//初始状态拉高
reg		[3:0]	num = 0;
reg		signed	[7:0]	tx_data = 0;
//==============================//
reg	flag = 1'b0;			//切换数据标志位
reg	flag_r1 = 1'b0;
reg	flag_r2 = 1'b0;
wire	flag_nege;
always @ (posedge clk)
begin
	if(num < 4'd10)
		flag <= 1'b0;
	else
		flag <= 1'b1;
end
always @ (posedge clk)
begin
	flag_r1 <= flag;
	flag_r2 <= flag_r1;
end
assign	flag_nege = ~flag_r1 & flag_r2;		//检测上升沿
//==============================//

always @(posedge clk) begin
	if((clk_bps == 1) && (uart_en == 1))	begin
		case (num)
			4'd0:
				begin
					uart_tx <= 0;			num <= num + 1;		//发送起始位
				end 
			4'd1: 
				begin
					uart_tx <= tx_data[0];	num <= num + 1;		//发送数据位
				end
			4'd2: 
				begin
					uart_tx <= tx_data[1];	num <= num + 1;		//发送数据位
				end
			4'd3: 
				begin
					uart_tx <= tx_data[2];	num <= num + 1;		//发送数据位
				end
			4'd4: 
				begin
					uart_tx <= tx_data[3];	num <= num + 1;		//发送数据位
				end
			4'd5: 
				begin
					uart_tx <= tx_data[4];	num <= num + 1;		//发送数据位
				end
			4'd6: 
				begin
					uart_tx <= tx_data[5];	num <= num + 1;		//发送数据位
				end
			4'd7: 
				begin
					uart_tx <= tx_data[6];	num <= num + 1;		//发送数据位
				end
			4'd8: 
				begin
					uart_tx <= tx_data[7];	num <= num + 1;		//发送数据位
				end
			4'd9: 
				begin
					uart_tx <= 0;			num <= num + 1;		//发送校验位
				end
			4'd10: 
				begin
					uart_tx <= 1;			num <= 4'd0;		//发送结束位
				end
		  	default:
			  	begin
				  	uart_tx <= 1;			num <= 4'd0;
				end
		endcase
	end
end

//----------------------------------------------------------------------------------------//
reg		[2:0]	num_r = 0;
//==============================//
reg	rd_clk_r0 = 1'b0;			
reg	rd_clk_r1 = 1'b0;
reg	rd_clk_r2 = 1'b0;
always @ (posedge clk)
begin
	if(num_r < 3'd5)
		rd_clk_r0 <= 1'b0;
	else
		rd_clk_r0 <= 1'b1;
end
always @ (posedge clk)
begin
	rd_clk_r1 <= rd_clk_r0;
	rd_clk_r2 <= rd_clk_r1;
end
assign	rd_clk = ~rd_clk_r1 & rd_clk_r2;		//检测下降沿
//==============================//

always @(posedge clk) begin
	if((flag_nege == 1) && (uart_en))	begin
		case (num_r)
			3'd0:
				begin
					tx_data <= data[7:0];	num_r <= num_r + 1;
				end
			3'd1:
				begin
					tx_data <= data[15:8];	num_r <= num_r + 1;
				end
			3'd2:
				begin
					tx_data <= data[23:16];	num_r <= num_r + 1;
				end
			3'd3:
				begin
					tx_data <= data[31:24];	num_r <= num_r + 1;
				end
			3'd4:
				begin
					tx_data <= 8'h0D;		num_r <= num_r + 1;
				end
			3'd5:
				begin
					tx_data <= 8'h0A;		num_r <= 3'd0;
				end
		  	default: 
		  		begin
				  	num_r <= 3'd0;
				end
		endcase
	end
end

assign	tx = uart_tx;

endmodule 
