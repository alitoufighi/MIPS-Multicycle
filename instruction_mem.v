module Instruction_mem(input[31:0] addr, output[31:0] out);

    wire[31:0] instruction_mem[0: 11];

    wire[31:0] shifted_address;
    assign shifted_address     = {2'b0, addr[31:2]};

    assign instruction_mem[0]  = 32'b100000_00000_00001_00000_11000001010; //-- Addi r1 ,r0 ,1546 //r1=1546
    assign instruction_mem[1]  = 32'b000001_00000_00001_00010_00000000000; //-- Add r2 ,r0 ,r1//r2=1546
    assign instruction_mem[2]  = 32'b000011_00000_00001_00011_00000000000; //-- sub r3 ,r0 ,r1//r3=-1546
    assign instruction_mem[3]  = 32'b000101_00010_00011_0010000000000000;  //-- and r4,r2,r3 //r4=2
    assign instruction_mem[4]  = 32'b100001_00011_00101_0001101000110100;  //-- subi r5,r3,//r5=-8254
    assign instruction_mem[5]  = 32'b000110_00011_00100_0010100000000000;  //-- or r5,r3,r4 //r5=-1546
    assign instruction_mem[6]  = 32'b000111_00101_00000_0011000000000000;  //-- nor r6,r5,r0//r6=1545
    assign instruction_mem[7]  = 32'b000111_00100_00000_0101100000000000;  //-- nor r11,r4,r0//r11=-3
    assign instruction_mem[8]  = 32'b000011_00101_00101_0010100000000000;  //-- sub r5,r5,r5//r5=0
    assign instruction_mem[9]  = 32'b100000_00000_00001_0000010000000000;  //-- addi r1,r0,1024 //r1=1024
    assign instruction_mem[10] = 32'b100101_00001_00010_0000000000000000;  //-- st r2 ,r1 ,0 //
    assign instruction_mem[11] = 32'b100100_00001_00101_00000_00000000000;  //-- ld r5 ,r1 ,0 //r5=1546

    assign out                 = instruction_mem[shifted_address];
endmodule
