`timescale 1ns/1ns
module tb();
  reg clk = 1, rst = 1;
  wire [17:0]s;
  assign s = {14'b0, rst, 3'b0};
  
    MIPS mips(.CLOCK_50(clk), .SW(s));
	
	initial begin
		#20 rst=~rst;

		repeat(900)#10 clk=~clk;
	end
    
endmodule
