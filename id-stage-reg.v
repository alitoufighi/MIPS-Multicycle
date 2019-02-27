module ID_Stage_reg(
	input clk,
	input rst,
	input flush,
	input [4:0] Dest_in,
	input [31:0] Reg2_in,
	input [31:0] Val2_in,
	input [31:0] Val1_in,
	input [31:0] PC_in,
	input [1:0] Br_type_in,
	input [3:0] EXE_CMD_in,
	input MEM_R_EN_in,
	input MEM_W_EN_IN,
	input WB_EN_in,
	output reg [4:0] Dest,
	output reg [31:0] Reg2,
	output reg [31:0] Val2,
	output reg [31:0] Val1,
	output reg [31:0] PC_out,
	output reg [1:0] Br_type,
	output reg [3:0] EXE_CMD,
	output reg MEM_R_EN,
	output reg MEM_W_EN,
	output reg WB_EN
	);
	
endmodule