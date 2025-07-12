// Seems to cause hdlBITS to hang?
module top_module #(
  parameter BITS = 100
)
(
    input logic [BITS - 1 : 0] a,
    input logic [BITS - 1 : 0] b,
    input logic cin,
    output logic [BITS - 1 : 0] sum,
    output logic cout
);
  wire [BITS - 1 : 0] carry;
  assign carry[0] = cin;

  genvar i, j, k;
  generate
    for (i = 1; i < BITS; i++) begin : loop
      wire [i - 1 : 0] or_reduction;
      for (j = 0; j < i; j++) begin : loop2
        wire [i - 1 : j] does_propagate;
        assign does_propagate[j] =
		(j == 0) ?
		(a[0] & b[0] | a[0] & cin | b[0] & cin)
		: a[j] & b[j];
        for (k = j + 1; k < i; k++) begin : loop3
          assign does_propagate[k] = a[k] | b[k];
        end
        assign or_reduction[j] = &does_propagate;
      end
      assign carry[i] = |or_reduction; 
    end
  endgenerate
  assign sum = a ^ b ^ carry;
  assign cout = carry[BITS - 1];
endmodule
