`timescale 1ns/1ps   // 定义仿真时间精度

module led_test_bt;

	// 输入激励信号源定义
	reg sig_a;
	reg sig_b;
	reg sig_key;
	
	// 模块响应观察点
	wire led_out;
	
	// 实例化模块，激励信号与模块关联；led_test(a,b,key_in,led_out);
	led_test test_demo(
		.a(sig_a),
		.b(sig_b),
		.key_in(sig_key),
		.led_out(led_out)
	);
	// 产生激励信号；
	initial begin
		sig_a=0;sig_b=0;sig_key=0;
		#100;   // 延时100*1ns
		sig_a=0;sig_b=0;sig_key=1;
		#100;
		sig_a=0;sig_b=1;sig_key=0;
		#100;
		sig_a=0;sig_b=1;sig_key=1;
		#100;
		sig_a=1;sig_b=0;sig_key=0;
		#100;
		sig_a=1;sig_b=0;sig_key=1;
		#100;
		sig_a=1;sig_b=1;sig_key=0;
		#100;
		sig_a=1;sig_b=1;sig_key=1;
		#200;
		$stop;
	end
endmodule


