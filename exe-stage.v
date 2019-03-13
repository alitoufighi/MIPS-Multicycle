module EXE_Stage(
		input clk,
		
		input [3:0] EXE_CMD,
		input [31:0] val1,
		input [31:0] val2,
		input [31:0] val_src2,
		input [1:0] Br_type,
		input [31:0] PC,

		output [31:0] ALU_result,
		output [31:0] Br_Addr,
		output Br_taken
);

	Adder adder(.val1(PC), .val2(val2), .result(Br_Addr));

	Condition_Check condition_check(.val1(val1), .val2(val_src2),
					.branch_type(Br_type), .branch_taken(Br_taken));

	ALU alu(.in1(val1), .in2(val2), .cmd(EXE_CMD), .result(ALU_result));
endmodule
