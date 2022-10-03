module BCD_counter(Clk, Cin, Rst_n, Cout, q);

	input Clk;		// 时钟
	input Cin;	// 计数时钟使能；
	input Rst_n;	// 计数器复位信号；
	
	output Cout;	// 计数溢出进位
	output [3:0]q;	// 计数值
	reg [3:0]cnt;
	
	always@(posedge Clk or negedge Rst_n)
	if(Rst_n == 1'b0)
		cnt <= 4'd0;
	else if(Cin == 1'b1)begin
		if(cnt == 4'd9)
			cnt <= 4'd0;
		else
			cnt <= cnt + 1'b1;
		end
	else
		cnt <= cnt;
/*	// 时序逻辑
	always@(posedge Clk or negedge Rst_n)
	if(Rst_n == 1'b0 )
		Cout <= 1'b0;
	else if(Cin == 1'b1 && cnt == 4'd9)
		Cout <= 1;
	else
		Cout <= 0;
*/
	// 将时序逻辑改为组合逻辑
	assign Cout = (Cin == 1'b1 && cnt == 4'd9);
	assign q = cnt;
endmodule

