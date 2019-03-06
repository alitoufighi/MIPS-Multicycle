module MEM_Stage_reg(
	input clk,
	input rst,

	input WB_en_in,
	input MEM_R_EN_in,
	input [31:0] ALU_result_in,
	input [31:0] MEM_read_value_in,
	input [4:0] Dest_in,
	input [31:0] PC_in,
	
	output reg WB_en,
	output reg MEM_R_EN,
	output reg [31:0] ALU_result,
	output reg [31:0] MEM_read_value,
	output reg [4:0] Dest,
	output reg[31:0] PC
	);

	always @(posedge clk, rst) begin
		if(rst) begin
			WB_en <= 0;
			MEM_R_EN <= 0;
			ALU_result <= 0;
			MEM_read_value <= 0;
			Dest <= 0;
			PC <= 0;
		end
		else begin
			WB_en <= WB_en_in;
			MEM_R_EN <= MEM_R_EN_in;
			ALU_result <= ALU_result_in;
			MEM_read_value <= MEM_read_value_in;
			Dest <= Dest_in;
			PC <= PC_in;
		end
	end
endmodule
