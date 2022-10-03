`timescale 1ns/1ns
`define CLK_PERIOD 20  // 20ns

module BCD_counter_tb;
	// 输入信号
	reg clk;
	reg cin;
	reg rst;
	
	// 输出信号定义
	wire cout; 
	wire [11:0]q;
	
	BCD_counter counter0(
		.Clk(clk), 
		.Cin(cin), 
		.Rst_n(rst), 
		.Cout(cout), 
		.q(q)
	);
	initial clk = 1'b1;
	always #(`CLK_PERIOD/2) clk=~clk;
	
	initial begin 
		rst = 1'b0;
		cin = 1'b0;
		#(`CLK_PERIOD*100);
		rst = 1'b1;
		#(`CLK_PERIOD*20);
		repeat(30) begin
			cin = 1'b1;
			#(`CLK_PERIOD);
			cin = 1'b0;
			#(`CLK_PERIOD*5);
		end
	$stop;
	end
	
	endmodule
