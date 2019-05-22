module Sram_Controller(
    input clk,
    input rst,

    // From Memory Stage
    input wr_en,
    input rd_en,
    input [17:0] addr,
    input [31:0] write_data,

    // To Next STage
    output reg [63:0] read_data,

    // To Freeze Other Stages
    output reg ready,

    inout [15:0] SRAM_DQ,           // SRAM Data bus
    output reg [17:0] SRAM_ADDR,    // SRAM Addr bus
    output SRAM_LB_N,               // SRAM Low-byte data mask
    output SRAM_UB_N,               // SRAM High-byte data mask
    output SRAM_WE_N,           // SRAM write enable
    output SRAM_CE_N,               // SRAM chip enable
    output SRAM_OE_N                // SRAM output enable
);
    assign SRAM_LB_N                     = 0;
    assign SRAM_UB_N                     = 0;
    assign SRAM_CE_N                     = 0;
    assign SRAM_OE_N                     = 0;
    reg[2:0] counter;

    assign SRAM_DQ = (wr_en) ? ((counter == 0) ? write_data[15:0] : ((counter == 1) ? write_data[31:16] : {16{1'bz}}))
                               : {16{1'bz}};

    assign SRAM_WE_N = ~((counter < 2) & wr_en);


    always @(*) begin
        ready                            <= 1;
        if (rd_en & (counter != 5))
            ready                        <= 0;

        else if (wr_en & (counter != 5))
            ready                        <= 0;
    end

    always @(*) begin
        case (counter)
            0: begin
                SRAM_ADDR                <= addr;
            end
            1: begin
                SRAM_ADDR                <= addr + 1;
            end
            2: begin
                SRAM_ADDR                <= addr + 2;
            end
            3: begin
                SRAM_ADDR                <= addr + 3;
            end
        endcase
        // if (counter == 0) begin
        //     SRAM_ADDR                 <= addr;
            
        // end
        // else if (counter == 1) begin
        //     SRAM_ADDR                 <= addr + 1;
        // end

        // else begin
        //     SRAM_ADDR                 <= SRAM_ADDR;
        // end
    end

    always @(posedge clk, posedge rst) begin 
        if (rst) begin
            counter                      <= 0;
        end

        else if (counter == 5)
            counter                      <= 0;
        
        else if (rd_en) begin
            counter                      <= counter + 1;
        end

        else if (wr_en) begin
            counter                      <= counter + 1;
        end

        else begin
            counter                      <= counter;
        end


    end

    always @ (posedge clk) begin 
        if (rd_en) begin
            case (counter)
                1:
                    begin
                        read_data[31:16] <= SRAM_DQ;
                    end
                2:
                    begin
                        read_data[15:0]  <= SRAM_DQ;
                    end

                3:
                    begin
                        read_data[63:48]  <= SRAM_DQ;
                    end

                4:
                    begin
                        read_data[47:32]  <= SRAM_DQ;
                    end

                default:
                    begin
                        read_data        <= read_data;
                    end
            endcase
        end

    end

endmodule