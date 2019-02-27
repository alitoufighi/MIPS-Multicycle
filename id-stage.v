module ID_Stage(
	input clk,
	input rst,
	input [31:0] Instruction,
	input WB_Write_Enable,
	input [4:0] WB_Dest,
	input [31:0] WB_Data,
	output IF_flush,
	output [4:0] Dest,
	output [31:0] Reg2,
	output [31:0] Val2,
	output [31:0] Val1,
	output Br_taken,
	output [3:0] EXE_CMD,
	output MEM_R_EN,
	output MEM_W_EN,
	output WB_EN,
	);
	wire [31:0] Reg1, Reg2;
	wire [31:0] sign_extended;
	Registers_file regfile(.clk(clk) , .rst(rst), .src1(Instruction[20:16]), .src2(Instruction[15:11]), .dest(WB_Dest), .Write_Val(WB_Data), .Write_EN(WB_Write_Enable), .out1(Reg1), .out2(Reg2));
	sign_extend extend(.in(Instruction[15:0]), .out(sign_extended));
	assign Val2 = is_imm ? sign_extended : Reg2;
	assign Val1 = Reg1;
endmodule