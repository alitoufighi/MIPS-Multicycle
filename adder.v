module Adder(
    input [31:0] val1,
    input [31:0] val2,

    input [31:0] result
);
    assign result = val1 + val2;
endmodule