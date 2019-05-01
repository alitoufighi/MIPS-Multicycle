module Sram_Controller(
    input clk,

    // From Memory Stage
    input wr_en,
    input rd_en,
    input [31:0] addr,
    input [31:0] write_data,

    // To Next STage
    output reg [31:0] read_data,

    // To Freeze Other Stages
    output reg ready,

    inout [15:0] SRAM_DQ,           // SRAM Data bus
    output reg [17:0] SRAM_ADDR,    // SRAM Addr bus
    output SRAM_LB_N,               // SRAM Low-byte data mask
    output SRAM_UB_N,               // SRAM High-byte data mask
    output reg SRAM_WE_N,           // SRAM write enable
    output SRAM_CE_N,               // SRAM chip enable
    output SRAM_OE_N                // SRAM output enable
);
    assign SRAM_LB_N = 0;
    assign SRAM_UB_N = 0;
    assign SRAM_CE_N = 0;
    assign SRAM_OE_N = 0;

    reg [2:0] counter = 0;

    assign SRAM_DQ = (wr_en) ? ((counter == 1) ? write_data[15:0] : (counter == 2) ? write_data[31:16] : {16{1'bz}})
                               : {16{1'bz}};

    always @ (posedge clk) begin
        ready = 1;
        SRAM_WE_N = 1;

        if (rd_en) begin
            ready = 0;
            counter = counter + 3'b1;
            case (counter)
                1:
                    begin
                        SRAM_ADDR = addr[17:0];
                    end
                2:
                    begin
                        SRAM_ADDR = addr[17:0] + 18'b1;
                        read_data[15:0] = SRAM_DQ;
                    end
                3:
                    begin
                        read_data[31:16] = SRAM_DQ;
                    end
                6:
                    begin
                        counter = 0;
                        ready = 1;
                    end
            endcase
        end

        else if (wr_en) begin
            ready = 0;
            counter = counter + 3'b1;

            case (counter)
                1:
                    begin
                        SRAM_ADDR = addr[17:0];
                        SRAM_WE_N = 0;
                    end 
                2:
                    begin
                        SRAM_ADDR = addr[17:0] + 18'b1;
                        SRAM_WE_N = 0;
                    end
                6:
                    begin
                        counter = 0;
                        ready = 1;
                    end
            endcase
        end
    end

endmodule