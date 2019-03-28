`timescale 1ns/1ns
module tb();
  reg clk = 0, rst = 1;
  wire [17:0]s;
  assign s = {14'b0, rst, 3'b0};
  
    MIPS mips(.CLOCK_50(clk), .SW(s));
	
    initial repeat(1000)#10 clk=~clk;
	initial repeat(1)#25 rst=~rst;
endmodule
