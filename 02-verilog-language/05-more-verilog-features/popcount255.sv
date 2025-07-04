module top_module( 
    input [254:0] in,
    output [7:0] out
);
	reg [7:0] count;
	always @(*) begin
		count = 8'd0;
		for (int i = 0; i < $bits(in); i++) begin
			if (in[i]) count++;
		end
	end
	assign out = count;
endmodule
