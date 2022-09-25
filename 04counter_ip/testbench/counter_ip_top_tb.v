/****
	测试文件： 两个4bit的计数器组成8bit的计数器的测试模块
*/
`timescale 1ns/1ns
`define clk_T 20	// 20ns 50MHZ 
module counter_ip_top_tb;
	reg clk;
	reg cin;
	wire cout;
	wire [7:0]q;
	
	counter_ip_top test0(
		.clk(clk),
		.cin(cin),
		.cout(cout),
		.q(q)
	);
	
	initial clk = 0;
	always#(`clk_T/2) clk=~clk;
	initial begin
		repeat(300) begin
			cin=0;
			#(`clk_T*5)cin=1;
			#(`clk_T)cin=0;
		end
		#(`clk_T*100);
		$stop;
	end
endmodule
