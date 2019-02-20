module IF_Stage (input clk, rst, output[31:0] PC, Instruction);
    Instruction_mem instruction_memory(PC, Instruction);

    always @(posedge clk, rst) begin
      if (rst)
        PC <= 0;
      else begin
        PC <= PC + 4;
      end
    end

endmodule