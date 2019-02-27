module WB_Stage(
	input clk,
	input WB_en_in,
	input MEM_R_EN,
	input [31:0] ALU_result,
	input [31:0] Mem_read_value,
	input [4:0] Dest_in,
	output WB_en,
	output [31:0] Write_value,
	output [4:0] Dest
	);
	// assign PC = PC_in;
endmodule