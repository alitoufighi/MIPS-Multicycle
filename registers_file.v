module Registers_file(
		input clk,
		input rst,

		input [4:0] src1,
		input [4:0] src2,
		input [4:0] dest,
		input [31:0] Write_Val,
		input Write_EN,

		output [31:0] out1,
		output [31:0] out2
);
	reg [31:0] registers[31:0];
	assign out1                     = registers[src1];
	assign out2                     = registers[src2];
	
	always @(negedge clk, posedge rst) begin : Memory
		if (rst) begin : reset_condition
			integer i;
			for(i = 0; i < 32; i = i + 1) begin
				registers[i] <= i;
			end
		end

		else if (Write_EN & (dest != 0))
			registers[dest] <= Write_Val;
	end
	
endmodule
