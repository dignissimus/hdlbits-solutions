module top_module(
	input [31:0] a,
	input [31:0] b,
	output [31:0] sum
);
	wire [15:0] sum_lower, sum_higher_zero, sum_higher_one;
	wire cout;
	add16 adder_lower(
		.a(a[15:0]),
		.b(b[15:0]),
		.cin(0),
		.cout(cout),
		.sum(sum_lower)
	);
	add16 adder_higher_zero(
		.a(a[31:16]),
		.b(b[31:16]),
		.cin(0),
		.sum(sum_higher_zero)
	);
	add16 adder_higher_one(
		.a(a[31:16]),
		.b(b[31:16]),
		.cin(1),
		.sum(sum_higher_one)
	);
	assign sum = {
		cout ? sum_higher_one : sum_higher_zero,
		sum_lower
	};
endmodule
