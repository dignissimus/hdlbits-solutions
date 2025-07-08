module hadd( 
    input a, b, cin,
    output cout, sum
);
	assign cout = a & b | a & cin | b & cin;
	assign sum = a ^ b ^ cin;
endmodule

module top_module( 
    input [3:0] x, y,
    output [4:0] sum
);

	wire [2:0] cout;
    hadd half_adder1(.a(x[0]), .b(y[0]), .cin(0), .sum(sum[0]), .cout(cout[0]));
    hadd half_adder2(.a(x[1]), .b(y[1]), .cin(cout[0]), .sum(sum[1]), .cout(cout[1]));
    hadd half_adder3(.a(x[2]), .b(y[2]), .cin(cout[1]), .sum(sum[2]), .cout(cout[2]));
    hadd half_adder4(.a(x[3]), .b(y[3]), .cin(cout[2]), .sum(sum[3]), .cout(sum[4]));
endmodule
