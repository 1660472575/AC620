
`timescale 1ns/1ns
`define CLK_T 20   // 20ns

module statusmach_tb;

	reg clk;
	reg rst;
	reg [7:0]data;
	
	wire out;
	
	statusmach statusmach01(
		.Clk(clk), 
		.Rst_n(rst), 
		.Data(data), 
		.Out(out)
	);
	initial clk = 1;
	always#(`CLK_T/2) clk = ~clk;
	initial begin
		rst = 0;
		data = 0;
		#(`CLK_T*200);
		rst = 1;
		#(`CLK_T*200 +1);
		forever begin
		
			data = "A";
			#(`CLK_T);
			data = "K";
			#(`CLK_T);
			data = "L";
			#(`CLK_T);
	
			data = "H";
			#(`CLK_T);
			data = "E";
			#(`CLK_T);
			data = "L";
			#(`CLK_T);
			data = "L";
			#(`CLK_T);
			data = "O";
			#(`CLK_T);
			
			data = "H";
			#(`CLK_T);
			data = "e";
			#(`CLK_T);
			data = "l";
			#(`CLK_T);
			
			data = "M";
			#(`CLK_T);
			data = "P";
			#(`CLK_T);
			
			data = "H";
			#(`CLK_T);
			data = "e";
			#(`CLK_T);
			data = "l";
			#(`CLK_T);
			data = "l";
			#(`CLK_T);
			data = "o";
			#(`CLK_T);
			
			data = "o";
			#(`CLK_T);
			data = "k";
			
			
			
			//------------------
		/*	
			data = "I";
			#(`CLK_T);
			data = "A";
			#(`CLK_T);
			data = "M";
			#(`CLK_T);
			data = "X";
			#(`CLK_T);
			data = "i";
			#(`CLK_T);
			data = "a";
			#(`CLK_T);
			data = "o";	
			#(`CLK_T);
			data = "M";
			#(`CLK_T);
			data = "e";
			#(`CLK_T);
			data = "i";
			#(`CLK_T);
			data = "g";
			#(`CLK_T);
			data = "e";	
			
			#(`CLK_T);
			data = "H";
			#(`CLK_T);
			data = "E";
			
			#(`CLK_T);
			data = "M";
			#(`CLK_T);
			data = "l";
			
			#(`CLK_T);
			data = "H";
			#(`CLK_T);
			data = "E";
			#(`CLK_T);
			data = "L";
			#(`CLK_T);
			data = "L";
			#(`CLK_T);
			data = "O";
			#(`CLK_T);
		
			data = "H";
			#(`CLK_T);
			data = "e";
			#(`CLK_T);
			data = "l";
			#(`CLK_T);
			data = "l";
			#(`CLK_T);
			data = "o";
			
			#(`CLK_T);
			data = "l";
		*/
		end
	end
endmodule



