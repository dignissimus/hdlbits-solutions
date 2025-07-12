module hadd(
	input x,
	input y,
	input cin,
	output sum,
	output cout
);
	assign sum = x ^ y ^ cin; 
	assign cout = x & cin | x & y | y & cin;
endmodule

module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
);
	wire [7:0] couts;
	hadd first_adder(.x(a[0]), .y(b[0]), .sum(s[0]), .cin(0), .cout(couts[0]));
	genvar i;
	generate
		for (i = 1; i < 8; i++) begin : loop
			hadd adder_instance(
				.x(a[i]),
				.y(b[i]),
				.cin(couts[i - 1]),
				.cout(couts[i]),
				.sum(s[i])
			);
		end
	endgenerate
	assign overflow = couts[7] ^ couts[6];
endmodule
