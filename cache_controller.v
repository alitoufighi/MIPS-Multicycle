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
    output reg sram_r_en,
    output reg sram_w_en,
);
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
    assign hit1 = (tag1[index_addr] == tag_addr) & valid1[index_addr];
    assign hit2 = (tag2[index_addr] == tag_addr) & valid2[index_addr];
    assign hit = hit1 | hit2;

    // find if ready
    assign ready = (~MEM_R_EN & ~MEM_W_EN) | (hit & sram_ready);

    // counter for counting clocks
    reg [2:0] counter;

    always @ (posedge clk, posedge rst) begin
        if (rst) begin
            counter <= 0;
        end

        else if (sram_r_en | sram_w_en) begin
            counter <= counter + 1;
        end
        
        if (counter == 6) begin
            counter <= 0;
        end
    end

    always @ (posedge clk, posedge rst) begin
        if (rst) begin
            integer i;
            for (i = 0; i < 64; i = i + 1) begin
                used[i] <= 0;
                valid1[i] <= 0;
                valid2[i] <= 0;
            end
            //ready <= 0;
            counter <= 0;
        end
        else begin
            if (MEM_R_EN) begin
                case (hit)
                    0:
                        if(counter == 0) begin
                            sram_address <= address;
                            sram_r_en <= 1;
                        end
                        else if (sram_ready) begin
                            sram_r_en <= 0;
                            case (used[index_addr])
                                0:
                                    // writing on 1
                                    data2[index_addr] <= sram_rdata;
                                    used[index_addr] <= 1;
                                1:
                                    // writing on 0
                                    data1[index_addr] <= sram_rdata;
                                    used[index_addr] <= 0;
                            endcase
                        end
                    1:
                        if(hit1) begin
                            rdata <= (word_addr == 0) ? data1[index_addr][31:0] : data1[index_addr][63:32];
                            used[index_addr] <= 0;
                        end
                        else begin
                            rdata <= (word_addr == 0) ? data2[index_addr][31:0] : data2[index_addr][63:32];
                            used[index_addr] <= 1;
                        end
                endcase
            end
            else if (MEM_W_EN) begin
                if (counter == 0) begin
                    sram_address <= address;
                    sram_wdata <= wdata;
                    sram_w_en <= 1;
                end
                else if (controller == 5) begin
                    sram_w_en <= 0;
                end
                if (hit) begin
                    case (word_addr)
                        0:
                            if (hit1) begin
                                data1[index_addr][31:0] <= wdata;
                                used[index_addr] <= 0;
                            end
                            else begin
                                data2[index_addr][31:0] <= wdata;
                                used[index_addr] <= 1;
                            end
                        1:
                            if (hit1) begin
                                data1[index_addr][63:32] <= wdata;
                                used[index_addr] <= 0;
                            end
                            else begin
                                data2[index_addr][63:32] <= wdata;
                                used[index_addr] <= 1;                            
                            end
                    endcase
                end
            end
        end
    end

endmodule