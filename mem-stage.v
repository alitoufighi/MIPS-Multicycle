module MEM_Stage(
        input clk,
        input rst,

        input MEM_R_EN_in,
        input MEM_W_EN_in,
        input [31:0] ALU_result_in,
        input [31:0] ST_val,

        output mem_freeze,
        output [31:0] Mem_read_value

        // inout [15:0] SRAM_DQ,           // SRAM Data bus
        // output [17:0] SRAM_ADDR,    // SRAM Addr bus
        // output SRAM_LB_N,               // SRAM Low-byte data mask
        // output SRAM_UB_N,               // SRAM High-byte data mask
        // output SRAM_WE_N,           // SRAM write enable
        // output SRAM_CE_N,               // SRAM chip enable
        // output SRAM_OE_N                // SRAM output enable
);

    wire [31:0] mem_addr;
    wire data_ready;

    // assign mem_addr = ((ALU_result_in - 1024) >> 2) << 1;
    // assign mem_freeze = ~data_ready;

    // Sram_Controller sram_controller(
    //         .clk(clk),
    //         // .rst(rst),

    //         // From Memory Stage
    //         .wr_en(MEM_W_EN_in),
    //         .rd_en(MEM_R_EN_in),
    //         .addr(mem_addr),
    //         .write_data(ST_val),

    //         // To Next STage
    //         .read_data(Mem_read_value),

    //         // To Freeze Other Stages
    //         .ready(data_ready),

    //         .SRAM_DQ(SRAM_DQ),           // SRAM Data bus
    //         .SRAM_ADDR(SRAM_ADDR),       // SRAM Addr bus
    //         .SRAM_LB_N(SRAM_LB_N),       // SRAM Low-byte data mask
    //         .SRAM_UB_N(SRAM_UB_N),       // SRAM High-byte data mask
    //         .SRAM_WE_N(SRAM_WE_N),       // SRAM write enable
    //         .SRAM_CE_N(SRAM_CE_N),       // SRAM chip enable
    //         .SRAM_OE_N(SRAM_OE_N)        // SRAM output enable
    // );

    // assign mem_freeze = 0;
    // assign mem_addr = (ALU_result_in - 1024) >> 2;

    // Data_Memory data_memory(
    //         .clk(clk),
    //         .addr(mem_addr),
    //         .write_val(ST_val),
    //         .MEM_R_EN(MEM_R_EN_in),
    //         .MEM_W_EN(MEM_W_EN_in),
    //         .read_val(Mem_read_value)
    // );


endmodule
