module MEM_Stage(
        input clk,

        input MEM_R_EN_in,
        input MEM_W_EN_in,
        input [31:0] ALU_result_in,
        input [31:0] ST_val,

        output mem_freeze,
        output [31:0] Mem_read_value
);
    wire [31:0] mem_addr;

    assign mem_addr = ((ALU_result_in - 1024) >> 2) << 1;

    
    Data_Memory data_memory(
            .clk(clk),
            .addr(mem_addr),
            .write_val(ST_val),
            .MEM_R_EN(MEM_R_EN_in),
            .MEM_W_EN(MEM_W_EN_in),
            .read_val(Mem_read_value)
    );
endmodule
