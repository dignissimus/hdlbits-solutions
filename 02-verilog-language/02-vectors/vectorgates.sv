module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);
	assign out_not[5:3] = ~b[2:0];
	assign out_not[2:0] = ~a[2:0];
	assign out_or_bitwise = b | a;
	assign out_or_logical = b || a;
endmodule
