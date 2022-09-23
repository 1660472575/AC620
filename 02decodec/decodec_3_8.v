/*
	3-8译码器模块设计程序.
*/
// module 名字必须和文件名称一样；
module decodec_3_8(a,b,c,out);
	// 指定输入端口
	input a;
	input b;
	input c;
	// 指定输出端口
	output reg [7:0]out;
	
	// 逻辑设计
	always@(a,b,c) begin
		case({a,b,c})
			3'b000: out = 8'b0000_0001;
			3'b001: out = 8'b0000_0010;
			3'b010: out = 8'b0000_0100;
			3'b011: out = 8'b0000_1000;
			3'b100: out = 8'b0001_0000;
			3'b101: out = 8'b0010_0000;
			3'b110: out = 8'b0100_0000;
			//3'b111: out = 8'b1000_0000; // 与default语句表达意思一样
			default: out = 8'b1000_0000;
		endcase
	end
endmodule