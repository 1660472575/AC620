/***
	1. 初始化数值： initial sig_clk = 1;  // 初始化.
	2. 宏定义：`define clock_period 20  和c语言的类似
	3. 引用宏：(`clock_period/2) 
*/
`timescale 1ns/1ns
`define clock_period 20   // sys_clk=50MHz
module counter_tb;

	reg sig_clk;
	reg sig_rst;
	wire led;

	counter counter_unit0(
		.Clk50M(sig_clk), 
		.Rst_n(sig_rst),
		.led(led)
	);
	
	initial sig_clk = 1;  // 初始化.
	// 类似while语句sig_clk延时指定时间翻转;
	always #(`clock_period/2) sig_clk = ~sig_clk;  
	initial begin
		sig_rst = 1'b0;
		#(`clock_period *200);
		sig_rst = 1'b1;
		#2000000000;
		$stop;
	end
endmodule

