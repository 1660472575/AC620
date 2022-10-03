`timescale 1ns/1ns
`define CLK_PERIOD	20

module BCD_Counter_Top_tb;
	reg clk;
	reg cin;
	reg rst;
	wire cout;
	wire [11:0]q;
	BCD_Counter_Top counter(
		.Clk(clk), 
		.Cin(cin), 
		.Rst_n(rst), 
		.Cout(cout), 
		.q(q)
	);
	
	initial clk = 1'b1;
	always#(`CLK_PERIOD/2) clk =~ clk;
	
	initial begin
		rst = 1'b0;
		cin = 1'b0;
		#(`CLK_PERIOD*200);
		rst = 1'b1;
		#(`CLK_PERIOD*20);
		cin = 1'b1;
		#(`CLK_PERIOD*5000);
		$stop;
	end
endmodule

