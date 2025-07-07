module top_module( 
    input [15:0] a, b, c, d, e, f, g, h, i,
    input [3:0] sel,
    output [15:0] out
);
	always @ (*) begin
		case (sel)
			15'd0: out = a;
			15'd1: out = b;
			15'd2: out = c;
			15'd3: out = d;
			15'd4: out = e;
			15'd5: out = f;
			15'd6: out = g;
			15'd7: out = h;
			15'd8: out = i;
			default: out = {16{1'b1}};
		endcase
	end
endmodule

