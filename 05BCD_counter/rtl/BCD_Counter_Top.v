module BCD_Counter_Top(Clk, Cin, Rst_n, Cout, q);
	input Clk;
	input Cin;
	input Rst_n;
	
	output Cout;
	output [11:0]q;
	
	wire cout0,cout1;
	wire [3:0]q0,q1,q2;
	
	assign q = {q2, q1, q0};   // 位拼接
	
	BCD_counter counter0(
		.Clk(Clk), 
		.Cin(Cin), 
		.Rst_n(Rst_n), 
		.Cout(cout0), 
		.q(q0)
	);
	
	BCD_counter counter1(
		.Clk(Clk), 
		.Cin(cout0), 
		.Rst_n(Rst_n), 
		.Cout(cout1), 
		.q(q1)
	);
	
	BCD_counter counter2(
		.Clk(Clk), 
		.Cin(cout1), 
		.Rst_n(Rst_n), 
		.Cout(Cout), 
		.q(q2)
	);



endmodule
