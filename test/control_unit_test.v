module control_unit_test();

    reg[5:0] opcode;
    wire exec_command, mem_read, mem_write, wb_enable, is_immediate;
    wire[1:0] branch_type;
    wire[16:0] test;
    Control_unit cu(opcode,
        exec_command, mem_read, mem_write, wb_enable, is_immediate, branch_type);

    assign test = {{16{opcode[0]}}, 1'b1};

    initial begin
        #10 opcode = 6'b100000;
        #10 opcode = 6'b000001;
    
        #10 opcode = 6'b100001;

        #10 opcode = 6'b000010;
        #10 $stop;
    end
endmodule