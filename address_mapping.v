module Address_Mapping(
    input [31:0] addr_in,
    output [31:0] addr_out
);
    assign addr_out = (addr_in - 1024) >> 2;
endmodule