module SRAM(
		input clk,
		input rst,
		inout[15: 0] SRAM_DQ,						//	SRAM Data bus 16 Bits
		input[17: 0] SRAM_ADDR,						//	SRAM Address bus 18 Bits
		input SRAM_WE_N						//	SRAM Write Enable
	);
	
	reg[15: 0] memory[0: 63];

	always @(posedge clk, posedge rst) begin
		if (rst) begin : reset
			integer i;
			for (i = 0; i < 64; i = i + 1) begin
				memory[i] <= i;
			end	
		end
		
		else if (~SRAM_WE_N) begin
			memory[SRAM_ADDR[5:0]] <= SRAM_DQ;
		end
	end

	wire[15: 0] temp;

	assign temp = clk ? temp : memory[SRAM_ADDR];
	assign SRAM_DQ = (SRAM_WE_N == 1) ? (clk ? temp : SRAM_DQ) : ( {16{1'bz}} );
endmodule
