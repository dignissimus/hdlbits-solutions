module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );

    wire [4:0] cins;
    assign cins[0] = cin;
    genvar i;
    generate
   	for (i = 0; i < 4; i++) begin : loop
		bcd_fadd adder(
			.a(a[4 * i + 3 : 4 * i]),
			.b(b[4 * i + 3 : 4 * i]),
			.cin(cins[i]),
			.cout(cins[i + 1]),
			.sum(sum[4 * i + 3 : 4 * i])
		);
	end	
    endgenerate
    assign cout = cins[4];
endmodule
