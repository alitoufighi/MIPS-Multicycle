module ID_Stage(
	input clk,
	input rst,

	input [31:0] Instruction,
	input WB_Write_Enable,
	input [4:0] WB_Dest,
	input [31:0] WB_Data,

	// output IF_flush,
	output [4:0] Dest,
	output [31:0] Reg2,
	output [31:0] Val2,
	output [31:0] Val1,
	output [1:0] Br_type,
	output [3:0] EXE_CMD,
	output MEM_R_EN,
	output MEM_W_EN,
	output WB_EN
);
	
	wire is_imm;
	Control_unit cu(
			.opcode(Instruction[31:26]),

			.exec_cmd(EXE_CMD),
			.mem_r_en(MEM_R_EN),
			.mem_w_en(MEM_W_EN),
			.wb_en(WB_EN),
			.is_imm(is_imm),
			.branch_type(Br_type)
	);

	wire [31:0] RegF1, RegF2;
	wire [31:0] sign_extended;
	// Registers_file regfile(.clk(clk) , .rst(rst), .src1(Instruction[20:16]), .src2(Instruction[15:11]), .dest(WB_Dest), .Write_Val(WB_Data), .Write_EN(WB_Write_Enable), .out1(RegF1), .out2(RegF2));
	// module Registers_file(input clk, rst, input [4:0] src1, src2, dest, input [31:0] Write_Val, input Write_EN, output [31:0] out1, out2);

	// sign_extend extend(.in(Instruction[15:0]), .out(sign_extended));
	assign Val2 = is_imm ? sign_extended : RegF2;
	assign Val1 = RegF1;
	assign Reg2 = RegF2;
endmodule
