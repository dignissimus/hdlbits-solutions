module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    assign out =
	    (~a & ~b & ~c
	    | ~c & ~d & ~a
	    | c & ~d & ~a
	    | ~a & b & c
	    | c & d & a
	    | ~c & a & ~b);
endmodule

