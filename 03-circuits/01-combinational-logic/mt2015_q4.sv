module A (input x, input y, output z);
	assign z = x & ~y;
endmodule

module B( input x, input y, output z );
        assign z = ~(x ^ y);
endmodule

module top_module (input x, input y, output z);
	wire ia1_out, ib1_out, ia2_out, ib2_out;
	A ia1(.x(x), .y(y), .z(ia1_out));
	B ib1(.x(x), .y(y), .z(ib1_out));
	A ia2(.x(x), .y(y), .z(ia2_out));
	B ib2(.x(x), .y(y), .z(ib2_out));
	assign z = (ia2_out & ib2_out) ^ (ia1_out | ib1_out);
endmodule

