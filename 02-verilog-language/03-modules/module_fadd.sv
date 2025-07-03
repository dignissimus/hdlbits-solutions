module top_module(
	input [31:0] a,
	input [31:0] b,
	output [31:0] sum
);
	wire [15:0] sum_lower, sum_higher;
	wire cout;
	add16 lower_adder(.a(a[15:0]), .b(b[15:0]), .cin(0), .cout(cout), .sum(sum_lower));
	add16 higher_adder(.a(a[31:16]), .b(b[31:16]), .cin(cout), .sum(sum_higher));
	assign sum = {sum_higher, sum_lower};
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );
	assign sum = a ^ b ^ cin;
	assign cout = a & b | a & cin | b & cin;
endmodule

