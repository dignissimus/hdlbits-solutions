module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum
);
	wire [99:0] couts;
	genvar i;
	bcd_fadd first_adder(
		.a(a[3:0]),
		.b(b[3:0]),
		.cin(cin),
		.cout(couts[0]),
		.sum(sum[3:0])
	);
	generate
		for (i = 1; i < 100; i += 1) begin : loop
			bcd_fadd fadder(
				.a(a[4 * (i + 1) - 1 -: 4]),
				.b(b[4 * (i + 1) - 1 -: 4]),
				.sum(sum[4 * (i + 1) - 1 -: 4]),
				.cin(couts[i - 1]),
				.cout(couts[i])
		);
		end
	endgenerate
	assign cout = couts[99];
endmodule

