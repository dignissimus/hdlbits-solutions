module top_module( 
    input [31:0] in,
    output [31:0] out );
    genvar i, j;
    generate
	for (i = 0; i < 32; i += 8) begin : outer
		for (j = 0; j < 8; j += 1) begin : inner
			assign out[i + j] = in[24 - i + j];
		end
	end
    endgenerate
endmodule

