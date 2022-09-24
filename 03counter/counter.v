/**
	简单说明： 
		1. 使用外部晶振时钟，延时控制led状态；
		2. 按键按下复位led时钟，熄灭led;
		板子上使用的晶振时钟50MHz，led闪烁周期1s;
		
		1. 延时计数值通过定义寄存器，来保存计数值;
		2. 多路并行执行，always语句新开启一路执行程序；
		3. 指定控制管脚 pin planner界面指定；
*/
module counter(Clk50M, Rst_n,led);
	
	input Clk50M;  // 系统时钟50M
	input Rst_n;	// 全局复位，低电平有效
	
	output reg led;	// led输出
	reg [24:0]cnt;		// 计数寄存器
	
	// 计数器进程
	always@(posedge Clk50M or negedge Rst_n)
	if(Rst_n == 1'b0)
		cnt <= 25'd0;
	else if(cnt == 25'd24_999_999)
		cnt <= 25'd0;
	else
		cnt <= cnt + 1'b1;
	// led电平控制进程
	always@(posedge Clk50M or negedge Rst_n)
	if(Rst_n == 1'b0)
		led <= 1'b1;
	else if(cnt == 25'd24_999_999)
		led <= ~led;
	else
		led <= led;
endmodule


