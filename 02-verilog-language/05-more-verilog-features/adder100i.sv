module add1(input a, input b, input cin, output sum, output cout);
	assign sum = a ^ b ^ cin;
	assign cout = (a & b) | (a & cin) | (b & cin);
endmodule

module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum
);
	add1 first_adder(.a(a[0]), .b(b[0]), .cin(cin), .cout(cout[0]), .sum(sum[0]));
	genvar i;
	generate
		for (i = 1; i < 100; i++) begin : loop
			add1 first_adder(.a(a[i]), .b(b[i]), .cin(cout[i - 1]), .cout(cout[i]), .sum(sum[i]));
		end
	endgenerate
endmodule
