`timescale 1ns/1ns
`define clk_prd	20   // 50MHZ

module counter_ip_tb;
	reg s_cin;
	reg s_clk;
	wire cout;
	wire [3:0] q;
	
	counter counter_unit0(
		.cin(s_cin),	// 计数器输入使能
		.clock(s_clk),	// counter输入时钟
		.cout(cout),	// 计数器溢出标志位 ， 1个时钟周期
		.q(q)				// 计数值输出
	);
	
	// 根据时钟
	initial s_clk=1;
	always#(`clk_prd/2) s_clk = ~s_clk;

	initial begin
		repeat(20) begin
			s_cin =0;
			#(`clk_prd*5)s_cin =1;
			#(`clk_prd) s_cin=0;
		end
		#(`clk_prd*200);
		$stop;
	end

endmodule
