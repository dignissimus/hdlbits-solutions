module top_module(
	input [31:0] a,
	input [31:0] b,
	output [31:0] sum
);
	wire q1, q2;
	wire[15:0] sum_upper;
	wire[15:0] sum_lower;
	add16 adder1(.a(a[15:0]), .b(b[15:0]), .cin(0), .cout(q1), .sum(sum_lower));
	add16 adder2(.a(a[31:16]), .b(b[31:16]), .cin(q1), .cout(q2), .sum(sum_upper));
	assign sum = {sum_upper, sum_lower};
endmodule
