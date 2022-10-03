/**
	使用状态机实现对字符串Hello的解析；
*/

module statusmach(Clk, Rst_n, Data, Out);
	input Clk;
	input Rst_n;
	input [7:0]Data;  // 判断字符
	
	output reg Out;
	
	localparam 
		CHECK_H = 5'b00001,
		CHECK_e = 5'b00010,
		CHECK_la = 5'b00100,
		CHECK_lb = 5'b01000,
		CHECK_o =  5'b10000;
	reg [4:0]cur_status;   // current status;
	
	always@(posedge Clk or negedge Rst_n)
	if(Rst_n == 1'b0)begin
		cur_status <= CHECK_H;
		Out <=	1'b1;
	end
	else begin
		case(cur_status)
			CHECK_H:
				if(Data == "H")
					cur_status <= CHECK_e;
				else
					cur_status <= CHECK_H;
			CHECK_e:
				if(Data == "e")
					cur_status <= CHECK_la;
				else
					cur_status <= CHECK_H;
			CHECK_la:
				if(Data == "l")
					cur_status <= CHECK_lb;
				else
					cur_status <= CHECK_H;
			CHECK_lb:
				if(Data == "l")
					cur_status <= CHECK_o;
				else
					cur_status <= CHECK_H;
			CHECK_o:
				begin
					cur_status <= CHECK_H;
					if(Data == "o")
						Out <= ~Out;
					else
						Out <= Out;
				end
			default:
				cur_status <= CHECK_H;
		endcase
	end 
endmodule
