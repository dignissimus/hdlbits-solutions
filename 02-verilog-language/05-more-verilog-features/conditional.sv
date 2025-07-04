module min2(input [7:0] first, input [7:0] second, output [7:0]  result);
	assign result = first < second ? first : second;	
endmodule
module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min
);
	wire [7:0] reduction_one, reduction_two;
	min2 first_reduction(.first(a), .second(b), .result(reduction_one));
	min2 second_reduction(.first(c), .second(d), .result(reduction_two));
	min2 final_reduction(
		.first(reduction_one),
		.second(reduction_two),
		.result(min)
	);
endmodule
