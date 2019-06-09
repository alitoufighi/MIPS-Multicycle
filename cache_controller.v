module Cache_Controller (
    input clk,
    input rst,

    // memory stage unit
    input [17:0] address,
    input [31:0] wdata,
    input MEM_R_EN,
    input MEM_W_EN,
    output [31:0] rdata,
    output ready,

    // SRAM controller
    input [63:0] sram_rdata,
    input sram_ready,
    output [17:0] sram_address,
    output [31:0] sram_wdata,
    output sram_r_en,
    output sram_w_en
);
    // data from address
    wire [8:0] tag_addr;
    wire [5:0] index_addr;
    wire word_addr;

    assign word_addr  = address[2];
    assign tag_addr   = address[17:9];
    assign index_addr = address[8:3];

    // registers for cache
    reg [63:0] used;

    reg [63:0] valid0;
    reg [63:0] valid1;

    reg [8:0] tag0 [0: 63];
    reg [8:0] tag1 [0: 63];

    reg [63:0] data0 [0:63];
    reg [63:0] data1 [0:63];

    // find if we have cache hit or not
    wire hit, hit0, hit1;
    assign hit0 = (tag0[index_addr] == tag_addr) & valid0[index_addr];
    assign hit1 = (tag1[index_addr] == tag_addr) & valid1[index_addr];
    assign hit = (hit0 | hit1) & ~MEM_W_EN;

    // read data from cache or sram
	assign rdata = (hit0) ? ((word_addr == 0) ? data0[index_addr][31:0] : data0[index_addr][63:32]) :
	               ((hit1) ? ((word_addr == 0) ? data1[index_addr][31:0] : data1[index_addr][63:32]) : 
	               (word_addr == 0) ? sram_rdata[31:0] : sram_rdata[63:32]);

	assign ready = MEM_W_EN & (sram_ready) | MEM_R_EN & (hit | sram_ready) | ~(MEM_R_EN | MEM_W_EN);

    wire must_read_sram;
    assign must_read_sram = (~hit & MEM_R_EN);

    assign sram_w_en = MEM_W_EN;
    assign sram_r_en = must_read_sram;
    assign sram_address = address << 1;
    assign sram_wdata = (MEM_W_EN) ? wdata : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;

	always @(posedge clk or posedge rst) begin
		if (rst) begin
			integer i;
			for (i = 0; i < 64; i = i + 1) begin
				used[i] <= 0;
                valid0[i] <= 0;
                valid1[i] <= 0;
                data0[i] <= 0;
                data1[i] <= 0;
			end
		end
		else begin
			if (MEM_W_EN & sram_ready) begin // vaghti sram ready 1 mishe mem_w_en 0 mishe!
				if (hit0) begin
                    valid0[index_addr] <= 0;
                    // used[index_addr] <= 0;
                    // valid0[index_addr] <= 1;
                    // tag0[index_addr] <= tag_addr;

					// if (word_addr == 0) begin
                    //     data0[index_addr][31:0] <= wdata;
					// end
					// else begin
                    //     data0[index_addr][63:32] <= wdata;
					// end
				end
				else if (hit1) begin
                    valid1[index_addr] <= 0;
                //     used[index_addr] <= 1;
                //     valid1[index_addr] <= 1;
                //     tag1[index_addr] <= tag_addr;

				// 	if (word_addr == 0) begin
                //         data1[index_addr][31:0] <= wdata;
				// 	end
				// 	else begin
                //         data1[index_addr][63:32] <= wdata;
				// 	end
				end
			end

			if (MEM_R_EN & sram_ready) begin
                if (hit0) begin
                    used[index_addr] <= 0;
                end
                else if (hit1) begin
                    used[index_addr] <= 1;
                end
                else begin
                    if (used[index_addr] == 1) begin
                        data0[index_addr] <= sram_rdata;
                        tag0[index_addr] <= tag_addr;
                        used[index_addr] <= 0;
                        valid0[index_addr] <= 1;
                    end
                    else begin
                        data1[index_addr] <= sram_rdata;
                        tag1[index_addr] <= tag_addr;
                        used[index_addr] <= 1;
                        valid1[index_addr] <= 1;
                    end
                end
			end
		end
	end

endmodule