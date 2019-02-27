module MEM_Stage_reg(
	input clk,
	input rst,
	input WB_en_in,
	input MEM_R_EN_in,
	input [31:0] ALU_result_in,
	input [31:0] Mem_read_value_in,
	input [4:0] Dest_in,
	input [31:0] PC_in,
	output reg WB_en;
	output reg MEM_R_EN,
	output reg [31:0] ALU_result,
	output reg [31:0] MeM_read_value,
	output reg [4:0] Dest,
	output reg[31:0] PC);
// 	always @(posedge clk, posedge rst) begin
// 		if(rst)
// 			PC <= 32'b0;
// 		else
// 			PC <= PC_in;
// 	end
endmodule