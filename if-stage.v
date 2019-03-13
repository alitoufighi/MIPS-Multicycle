module IF_Stage (
	input clk,
	input rst,
	input Br_taken,
	input [31:0] Br_Addr,
	output reg [31:0] PC,
	output [31:0] Instruction
	);
   
	Instruction_mem instruction_memory(
			.addr(PC),
			.out(Instruction)
	);

	always @(posedge clk, posedge rst) begin
		if(rst)
			PC <= 32'b0;
		else begin
			if(Br_taken)
				PC <= Br_Addr;
			else
				PC <= PC + 4;
		end
	end

endmodule
