module top_module(
	input [31:0] a,
	input [31:0] b,
	input sub,
	output [31:0] sum
);
	wire [31:0] addend = {32{sub}} ^ b[31:0];
	wire cout;
	wire [15:0] sum_higher, sum_lower;
	add16 lower_sum(
		.cin(sub),
		.a(a[15:0]),
		.b(addend[15:0]),
		.cout(cout),
		.sum(sum_lower)
	);
	add16 higher_sum(
		.cin(cout),
		.a(a[31:16]),
		.b(addend[31:16]),
		.sum(sum_higher)
	);
	assign sum = {sum_higher, sum_lower};	
endmodule
