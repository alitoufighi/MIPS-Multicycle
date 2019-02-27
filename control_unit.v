module Control_unit(input[5:0] opcode,
        output exec_command, mem_read, mem_write, wb_enable, is_immediate, output[1:0] branch_type);

        assign is_immediate = ((opcode == 6'b100000) || (opcode == 6'b100001))?1:0;
endmodule