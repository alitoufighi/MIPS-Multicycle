module Instruction_mem(
    input[31:0] addr,
    output[31:0] out
);
    wire[31:0] instruction_mem[0: 1023];

    wire[31:0] shifted_address;
    assign shifted_address     = {2'b0, addr[31:2]};
/////// to fuck git
    assign instruction_mem[0 ] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[1 ] = 32'b100000_00000_00001_00000_11000001010;//-- Addi r1 ,r0 ,1546 //r1=1546
    assign instruction_mem[2 ] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[3 ] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[4 ] = 32'b000001_00000_00001_00010_00000000000;//-- Add r2 ,r0 ,r1//r2=1546
    assign instruction_mem[5 ] = 32'b000011_00000_00001_00011_00000000000;//-- sub r3 ,r0 ,r1//r3=-1546
    assign instruction_mem[6 ] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[7 ] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[8 ] = 32'b000101_00010_00011_0010000000000000; //-- and r4,r2,r3 //r4=2
    assign instruction_mem[9 ] = 32'b100001_00011_00101_0001101000110100; //-- subi r5,r3,//r5=-8254
    assign instruction_mem[10] = 32'b000110_00011_00100_0010100000000000; //-- or r5,r3,r4 //r5=-1546
    assign instruction_mem[11] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[12] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[13] = 32'b000111_00101_00000_0011000000000000; //-- nor r6,r5,r0//r6=1545
    assign instruction_mem[14] = 32'b000111_00100_00000_0101100000000000; //-- nor r11,r4,r0//r11=-3
    assign instruction_mem[15] = 32'b000011_00101_00101_0010100000000000; //-- sub r5,r5,r5//r5=0
    assign instruction_mem[16] = 32'b100000_00000_00001_0000010000000000; //-- addi r1,r0,1024 //r1=1024
    assign instruction_mem[17] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[18] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[19] = 32'b100101_00001_00010_0000000000000000; //-- st r2 ,r1 ,0 //
    assign instruction_mem[20] = 32'b100100_00001_00101_00000_00000000000;//-- ld r5 ,r1 ,0 //r5=1546
    assign instruction_mem[21] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[22] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[23] = 32'b101000_00101_00000_00000_00000000001;//-- Bez r5 ,1//not taken
    assign instruction_mem[24] = 32'b001000_00101_00001_00111_00000000000;//-- xor r7 ,r5 ,r1 //r7=522
    assign instruction_mem[25] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[26] = 32'b001000_00101_00001_00000_00000000000;//-- xor r0 ,r5 ,r1 //r0=0
    assign instruction_mem[27] = 32'b001001_00011_00100_00111_00000000000;//-- sla r7 ,r3 ,r4//r7=-6184
    assign instruction_mem[28] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[29] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[30] = 32'b100101_00001_00111_00000_00000010100;//-- st r7 ,r1 ,20
    assign instruction_mem[31] = 32'b001010_00011_00100_01000_00000000000;//-- sll r8 ,r3 ,r4 //r8=-6184
    assign instruction_mem[32] = 32'b001011_00011_00100_01001_00000000000;//-- sra r9 ,r3 ,r4 //r9=1073741437     	 //!!!!! r9=-387
    assign instruction_mem[33] = 32'b001100_00011_00100_01010_00000000000;//-- srl r10 ,r3 ,r4//r10=-384            //!!!!! r10=1073741437````
    assign instruction_mem[34] = 32'b100101_00001_00011_00000_00000000100;//-- st r3 ,r1 ,4
    assign instruction_mem[35] = 32'b100101_00001_00100_00000_00000001000;//-- st r4 ,r1 ,8
    assign instruction_mem[36] = 32'b100101_00001_00101_00000_00000001100;//-- st r5 ,r1 ,12
    assign instruction_mem[37] = 32'b100101_00001_00110_00000_00000010000;//-- st r6 ,r1 ,16
    assign instruction_mem[38] = 32'b100100_00001_01011_00000_00000000100;//-- ld r11 ,r1 ,4//r11=-1456             //!!!! r11=-1546
    assign instruction_mem[39] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[40] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[41] = 32'b100101_00001_01011_00000_00000011000;//-- st r11 ,r1 ,24
    assign instruction_mem[42] = 32'b100101_00001_01001_00000_00000011100;//-- st r9 ,r1 ,28
    assign instruction_mem[43] = 32'b100101_00001_01010_00000_00000100000;//-- st r10 ,r1 ,32
    assign instruction_mem[44] = 32'b100101_00001_01000_00000_00000100100;//-- st r8 ,r1 ,36
    assign instruction_mem[45] = 32'b100000_00000_00001_00000_00000000011;//-- Addi r1 ,r0 ,3 //r1=3
    assign instruction_mem[46] = 32'b100000_00000_00100_00000_10000000000;//-- Addi r4 ,r0 ,1024 //r4=1024
    assign instruction_mem[47] = 32'b100000_00000_00010_00000_00000000000;//-- Addi r2 ,r0 ,0 //r2=0
    assign instruction_mem[48] = 32'b100000_00000_00011_00000_00000000001;//-- Addi r3 ,r0 ,1 //r3=1        // BR2 Dest
    assign instruction_mem[49] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[50] = 32'b100000_00000_01001_00000_00000000010;//-- Addi r9 ,r0 ,2 //r9=2        // BR1 Dest
    assign instruction_mem[51] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[52] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[53] = 32'b001010_00011_01001_01000_00000000000;//-- sll r8 ,r3 ,r9 //r8=r3 << 2
    assign instruction_mem[54] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[55] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[56] = 32'b000001_00100_01000_01000_00000000000;//-- Add r8 ,r4 ,r8 //r8=1024 + r8
    assign instruction_mem[57] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[58] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[59] = 32'b100100_01000_00101_00000_00000000000;//-- ld r5 ,r8 ,0 //r5=M[r8]
    assign instruction_mem[60] = 32'b100100_01000_00110_11111_11111111100;//-- ld r6 ,r8 ,-4 //r6=M[r8-4]
    assign instruction_mem[61] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[62] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[63] = 32'b000011_00101_00110_01001_00000000000;//-- sub r9 ,r5 ,r6 //r9=r5-r6
    assign instruction_mem[64] = 32'b100000_00000_01010_10000_00000000000;//-- Addi r10 ,r0 ,-0x8000 //r10=-32768
    assign instruction_mem[65] = 32'b100000_00000_01011_00000_00000010000;//-- Addi r11 ,r0 ,16 //r11=16
    assign instruction_mem[66] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[67] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[68] = 32'b001010_01010_01011_01010_00000000000;//-- sll r10 ,r10 ,r11 //r10=-2147483648
    assign instruction_mem[69] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[70] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[71] = 32'b000101_01001_01010_01001_00000000000;//-- And r9 ,r9 ,r10 // if(r5>r6) r9=0 else r9=-2147483648
    assign instruction_mem[72] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[73] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[74] = 32'b101000_01001_00000_00000_00000000010;//-- Bez r9 ,2
    assign instruction_mem[75] = 32'b100101_01000_00101_11111_11111111100;//-- st r5 ,r8 ,-4
    assign instruction_mem[76] = 32'b100101_01000_00110_00000_00000000000;//-- st r6 ,r8 ,0
    assign instruction_mem[77] = 32'b100000_00011_00011_00000_00000000001;//-- Addi r3 ,r3 ,1 //r3++
    assign instruction_mem[78] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[79] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[80] = 32'b101001_00001_00011_11111_11111100001;//-- BNE r1 ,r3 ,-31          // BR1
    assign instruction_mem[81] = 32'b100000_00010_00010_00000_00000000001;//-- Addi r2 ,r2 ,1 //r2++
    assign instruction_mem[82] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[83] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[84] = 32'b101001_00001_00010_11111_11111011011;//-- BNE r1 ,r2 ,-37          // BR2
    assign instruction_mem[85] = 32'b100000_00000_00001_00000_10000000000;//-- Addi r1 ,r0 ,1024 //r1=1024
    assign instruction_mem[86] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[87] = 32'b000000_00000_00000_00000_00000000000;//-- NOP
    assign instruction_mem[88] = 32'b100100_00001_00010_00000_00000000000;//-- ld ,r2 ,r1 ,0 //r2=-1546
    assign instruction_mem[89] = 32'b100100_00001_00011_00000_00000000100;//-- ld ,r3 ,r1 ,4 //r3=2
    assign instruction_mem[90] = 32'b100100_00001_00100_00000_00000001000;//-- ld ,r4 ,r1 ,8 //r4=1546
    assign instruction_mem[91] = 32'b100100_00001_00100_00000_01000001000;//-- ld ,r4 ,r1 ,520 // after SRAM r4=random number
    assign instruction_mem[92] = 32'b100100_00001_00100_00000_10000001000;//-- ld ,r4 ,r1 ,1023 // after SRAM r4=random number
    assign instruction_mem[93] = 32'b100100_00001_00101_00000_00000001100;//-- ld ,r5 ,r1 ,12 // r5=1546
    assign instruction_mem[94] = 32'b100100_00001_00110_00000_00000010000;//-- ld ,r6 ,r1 ,16 //r6=1545
    assign instruction_mem[95] = 32'b100100_00001_00111_00000_00000010100;//-- ld ,r7 ,r1 ,20 //r7=-6184
    assign instruction_mem[96] = 32'b100100_00001_01000_00000_00000011000;//-- ld ,r8 ,r1 ,24 //r8=-1546
    assign instruction_mem[97] = 32'b100100_00001_01001_00000_00000011100;//-- ld ,r9 ,r1 ,28 //r9=1073741437       // !!! r9=-387
    assign instruction_mem[98] = 32'b100100_00001_01010_00000_00000100000;//-- ld ,r10,r1 ,32 //r10=-387            // !!! r10=1073741437
    assign instruction_mem[99] = 32'b100100_00001_01011_00000_00000100100;//-- ld ,r11,r1 ,36 //r11=-6184
    assign instruction_mem[100] = 32'b101010_00000_00000_11111_11111111111;//-- JMP -1*/

    assign out                 = instruction_mem[shifted_address];
endmodule

