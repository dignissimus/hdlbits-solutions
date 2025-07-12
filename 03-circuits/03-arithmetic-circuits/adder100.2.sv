module top_module (
    input [99:0] a,
    input [99:0] b,
    input cin,
    output [99:0] sum,
    output cout
);      
  assign {cout, sum} = a + b + cin;
endmodule
