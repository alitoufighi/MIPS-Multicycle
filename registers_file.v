module Registers_file(input clk, rst, input [4:0] src1, src2, dest, input [31:0] Write_Val, input Write_EN, output [31:0] out1, out2);
	reg [31:0] registers[31:0];
	assign out1 = registers[src1],
			 out2 = registers[src2];
	always @(negedge clk, rst) begin
		if(rst) begin
			integer i;
			for(i = 0; i < 32; i=i+1) begin
				registers[i] <= i;
			end
		end
		else begin
			if(Write_EN) begin
				if(dest != 0) begin
					registers[dest] <= Write_Val;
				end
			end
		end
	end
endmodule