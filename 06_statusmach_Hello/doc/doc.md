verilog语法说明：
	if(cond)
			// 中间只能有一行，有要求使用多行，需要使用begin--end连接；
	else
例如：
	if(1)begin
		code1
		code2
	end
	else begin
		code1
		code2
	end
错误例子：
	if(1)
		code1  // 执行出问题
		code2
	else
		code1
//TODO
	仿真分析的时候，出现out输出没有翻转；具体问题还未知；