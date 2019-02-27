module IF_Stage_reg(
	input clk,
	input rst,
	input flush,
	input [31:0] PC_in,
	input [31:0] Instruction_in,
	output reg[31:0] PC,
	output reg[31:0]Instruction
	);
	always @(posedge clk, posedge rst) begin
		if(rst)
			PC <= 32'b0;
		else
			PC <= PC_in;
	end
endmodule