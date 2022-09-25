/**
	两个4bit输出计数器组成一个8bit输出的计数器
*/
module counter_ip_top(clk,cin,cout,q);  // q计数器输出数值
	input clk;
	input cin;
	output cout;
	output [7:0]q;
	wire c_line;  // 定义连线
	
	// 引用计数器模块
	counter counter0(	// 低4bit的计数器模块
		.cin(cin),
		.clock(clk),
		.cout(c_line),
		.q(q[3:0])
	);
	counter counter1(	// 高4bit的计数器模块
		.cin(c_line),
		.clock(clk),
		.cout(cout),
		.q(q[7:4])
	);

endmodule