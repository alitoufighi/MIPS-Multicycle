module Control_unit(
        input[5:0] opcode,

        output reg[3:0] exec_cmd,
        output reg mem_r_en,
        output reg mem_w_en,
        output reg wb_en,
        output reg is_imm,
        output reg[1:0] branch_type,
        output reg single_src,
        output reg if_store_bne
);
    always @(*) begin
        exec_cmd             <= 4'b0;
        is_imm               <= 0;
        mem_r_en             <= 0;
        mem_w_en             <= 0;
        wb_en                <= 0;
        branch_type          <= 2'b0;
        single_src           <= 0;
        if_store_bne         <= 0;
        
        case(opcode)
            6'b000000: begin // NOP
                exec_cmd     <= 4'b0000;
            end
            
            6'b000001: begin // ADD
                exec_cmd     <= 4'b0000;
                wb_en        <= 1;
            end
            
            6'b000011: begin // SUB
                exec_cmd     <= 4'b0010;
                wb_en        <= 1;
            end

            6'b000101: begin // AND
                exec_cmd     <= 4'b0100;
                wb_en        <= 1;
            end

            6'b000110: begin // OR
                exec_cmd     <= 4'b0101;
                wb_en        <= 1;
            end
            
            6'b000111: begin // NOR
                exec_cmd     <= 4'b0110;
                wb_en        <= 1;
            end
            
            6'b001000: begin // XOR
                exec_cmd     <= 4'b0111;
                wb_en        <= 1;
            end
            
            6'b001001: begin // SLA
                exec_cmd     <= 4'b1000;
                wb_en        <= 1;
            end
            
            6'b001010: begin // SLL
                exec_cmd     <= 4'b1000;
                wb_en        <= 1;
            end
            
            6'b001011: begin // SRA
                exec_cmd     <= 4'b1001;
                wb_en        <= 1;
            end
            
            6'b001100: begin // SRL
                exec_cmd     <= 4'b1010;
                wb_en        <= 1;
            end
            
            6'b100000: begin // ADDI
                exec_cmd     <= 4'b0000;
                is_imm       <= 1;
                wb_en        <= 1;
                single_src   <= 1;
            end
            
            6'b100001: begin // SUBI
                exec_cmd     <= 4'b0010;
                is_imm       <= 1;
                wb_en        <= 1;
                single_src   <= 1;
            end
            
            6'b100100: begin // LD
                exec_cmd     <= 4'b0000;
                is_imm       <= 1;
                mem_r_en     <= 1;
                wb_en        <= 1;
                single_src   <= 1;
            end
            
            6'b100101: begin // ST
                exec_cmd     <= 4'b0000;
                is_imm       <= 1;
                mem_w_en     <= 1;
                if_store_bne <= 1;
            end
            
            6'b101000: begin // BEZ
                exec_cmd     <= 4'b0000;
                is_imm       <= 1;
                branch_type  <= 2'b01;
                single_src   <= 1;
            end
            
            6'b101001: begin // BNE
                exec_cmd     <= 4'b0000;
                is_imm       <= 1;
                branch_type  <= 2'b10;
                if_store_bne <= 1;
            end
            
            6'b101010: begin // JMP
                exec_cmd     <= 4'b0000;
                is_imm       <= 1;
                branch_type  <= 2'b11;
                single_src   <= 1;
            end
            default: begin
                exec_cmd     <= 4'b0000;
                is_imm       <= 0;
                branch_type  <= 2'b00;
                single_src   <= 0;
            end
        endcase
    end
endmodule
