`timescale 1ns/1ns
module tb();
  reg clk                     = 1, rst = 1;
  wire [17:0]s;
  assign s                    = {14'b0, rst, 3'b0};
  
  wire [15:0] SRAM_DQ;
  wire SRAM_ADDR;
  wire SRAM_WE_N;

	MIPS mips(
			.CLOCK_50(clk),
			.SW(s), 
		   	.SRAM_DQ(SRAM_DQ),           // SRAM Data bus
		    .SRAM_ADDR(SRAM_ADDR),    // SRAM Addr bus
			.SRAM_WE_N(SRAM_WE_N)          // SRAM write enable
	);

	initial begin
		#20 rst               =~rst;

		repeat(900)#10 clk    =~clk;
	end
    
endmodule


// module SRAM(
// 		input clk,

// 		inout[15:0] SRAM_DQ,
	  	
// 	  	input[17:0] SRAM_ADDR,
// 	  	input SRAM_WE_N
// );
// 	reg [15:0] memory [0:262144];

// 	wire[15:0] SRAM_DQ_O;

// 	assign SRAM_DQ = clk ? SRAM_DQ_O : SRAM_DQ;
// 	assign SRAM_DQ_O = clk ? SRAM_DQ_O : ()
//     always @(posedge clk) begin
//         if (SRAM_WE_N)
//             memory[SRAM_ADDR] <= SRAM_DQ;
//         else
//             SRAM_DQ           <= memory[SRAM_ADDR];
//     end
// endmodule