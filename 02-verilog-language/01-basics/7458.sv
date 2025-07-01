`default_nettype none
module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y
);

	wire p2a_and_p2b;
	wire p2c_and_p2d;
	wire p1a_and_p1b_and_p1c;
	wire p1d_and_p1e_and_p1f;
	assign p2a_and_p2b = p2a & p2b;
	assign p2c_and_p2d = p2c & p2d;
	assign p1a_and_p1b_and_p1c = p1a & p1b & p1c;
	assign p1d_and_p1e_and_p1f = p1d & p1e & p1f;
	assign p2y = p2a_and_p2b | p2c_and_p2d;
	assign p1y = p1a_and_p1b_and_p1c | p1d_and_p1e_and_p1f;
endmodule
