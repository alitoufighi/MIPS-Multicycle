module IF_Stage (input clk, rst, output reg[31:0] PC, Instruction);
    Instruction_mem instruction_memory(PC, Instruction);

    always @(posedge clk, posedge rst) begin
      if (rst)
        PC <= 32'b0;
      else begin
        PC <= PC + 4;
      end
    end

endmodule