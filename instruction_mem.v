module Instruction_mem(input[31:0] addr, output[31:0] out);

    wire[31:0] instruction_mem[6:0];

    wire[31:0] shifted_address;
    assign shifted_address = {2'b0, addr[31:2]};
    assign instruction_mem[0] = 32'b000000_00001_00010_00000_00000000000;
    assign instruction_mem[1] = 32'b000000_00011_00100_00000_00000000000;
    assign instruction_mem[2] = 32'b000000_00101_00110_00000_00000000000;
    assign instruction_mem[3] = 32'b000000_00111_01000_00010_00000000000;
    assign instruction_mem[4] = 32'b000000_01001_01010_00011_00000000000;
    assign instruction_mem[5] = 32'b000000_01011_01100_00000_00000000000;
    assign instruction_mem[6] = 32'b000000_01101_01110_00000_00000000000;

    assign out = instruction_mem[shifted_address];
endmodule
