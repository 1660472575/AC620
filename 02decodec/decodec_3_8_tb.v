`timescale 1ns/1ps
module decodec_3_8_tb;

	// 激励信号源；
	reg a;
	reg b;
	reg c;
	
	wire [7:0] Y;
	decodec_3_8 test_uint(
	.a(a),
	.b(b),
	.c(c),
	.out(Y));
	
	// 产生信号激励
	initial begin
		a = 0;b = 0;c=0;
		#200;
		a = 0;b = 0;c=1;
		#200;
		a = 0;b = 1;c=0;
		#200;
		a = 0;b = 1;c=1;
		#200;
		a = 1;b = 0;c=0;
		#200;
		a = 1;b = 0;c=1;
		#200;
		a = 1;b = 1;c=0;
		#200;
		a = 1;b = 1;c=1;
		#200;
		$stop;
	end 
endmodule
