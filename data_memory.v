module Data_Memory(
    input clk,
    input [31:0] addr,
    input [31:0] write_val,
    input MEM_R_EN,
    input MEM_W_EN,

    output [31:0] read_val
);
    reg [31:0] memory [0:63];

    assign read_val = (MEM_R_EN) ? memory[addr] : 32'b0;

    always @(posedge clk) begin        
        if(MEM_W_EN)
            memory[addr] <= write_val;
    end
endmodule
