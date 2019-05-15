module cache_controller (
    input clk,
    input rst,

    // memory stage unit
    input [17:0] address,
    input [31:0] wdata,
    input MEM_R_EN,
    input MEM_W_EN,
    output reg [31:0] rdata,
    output ready,

    // SRAM controller
    input [63:0] sram_rdata,
    input sram_ready,
    output reg [17:0] sram_address,
    output reg [31:0] sram_wdata,
    output write
);
    // counter for counting clocks
    reg [2:0] counter;

    // data from address
    wire [8:0] tag_addr;
    wire [5:0] index_addr;
    wire word_addr;

    assign word_addr = address[2];
    assign tag_addr = address[17:9];
    assign index_addr = address[8:3];

    // registers for cache
    reg [63:0] used;

    reg [63:0] valid1;
    reg [63:0] valid2;

    reg [8:0] tag1 [63:0];
    reg [8:0] tag2 [63:0];

    reg [63:0] data1 [63:0];
    reg [63:0] data2 [63:0];

    // find if we have cache hit or not
    wire hit, hit1, hit2;
    assign hit1 = MEM_R_EN & (tag1[index_addr] == tag_addr) & valid1[index_addr];
    assign hit2 = MEM_R_EN & (tag2[index_addr] == tag_addr) & valid2[index_addr];
    assign hit = hit1 | hit2;

    // find if ready
    assign ready = hit | sram_ready;

    always @ (posedge clk, posedge rst) begin
        if (rst) begin
            integer i;
            for (i = 0; i < 64; i = i + 1) begin
                used[i] <= 0;
                valid1[i] <= 0;
                valid2[i] <= 0;
            end
            ready <= 0;
            counter <= 0;
        end
        else begin
            if (MEM_R_EN) begin
                case (hit)
                    0:
                        // not implemented
                    1:
                        if(hit1) begin
                            rdata <= (word_addr == 0) ? data1[index_addr][31:0] : data1[index_addr][63:32];
                        end
                        else begin
                            rdata <= (word_addr == 0) ? data2[index_addr][31:0] : data2[index_addr][63:32];
                        end
                endcase
            end
            else if (MEM_W_EN) begin
                sram_address <= address;
                sram_wdata <= wdata;
                if (hit) begin
                    case (word_addr)
                        0:
                            if (hit1) begin
                                data1[index_addr][31:0] <= wdata;
                            end
                            else begin
                                data2[index_addr][31:0] <= wdata;
                            end
                        1:
                            if (hit1) begin
                                data1[index_addr][63:32] <= wdata;
                            end
                            else begin
                                data2[index_addr][63:32] <= wdata;
                            end
                    endcase
                end
            end
        end
    end

endmodule