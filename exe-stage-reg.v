module EXE_Stage_reg(
	input clk,
	input rst,
	input WB_en_in,
	input MEM_R_EN_in,
	input MEM_W_EN_in,
	
	input [31:0] PC_in,
	input [31:0] ALU_result_in,
	input [31:0] ST_val_in,
	input [31:0] Dest_in,
	
	output reg WB_en,
	
	output reg MEM_R_EN,
	output reg MEM_W_EN,
	output reg [31:0] PC,
	output reg [31:0] ALU_result,
	output reg [31:0] ST_val,
	output reg [4:0] Dest
);
/*	always @(posedge clk, posedge rst) begin
		if(rst)
			PC <= 32'b0;
		else
			PC <= PC_in;
	end */
endmodule