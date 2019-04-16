module ID_Stage_reg(
    input clk,
    input rst,
    input flush,

    input [4:0] Dest_in,
    input [4:0] Src1_in,
    input [4:0] Src2_in,
    input [31:0] Reg2_in,
    input [31:0] Val2_in,
    input [31:0] Val1_in,
    input [31:0] PC_in,
    input [1:0] Br_type_in,
    input [3:0] EXE_CMD_in,
    input MEM_R_EN_in,
    input MEM_W_EN_in,
    input WB_EN_in,

    output reg [4:0] Dest,
    output reg [4:0] Src1,
    output reg [4:0] Src2,
    output reg [31:0] Reg2,
    output reg [31:0] Val2,
    output reg [31:0] Val1,
    output reg [31:0] PC_out,
    output reg [1:0] Br_type,
    output reg [3:0] EXE_CMD,
    output reg MEM_R_EN,
    output reg MEM_W_EN,
    output reg WB_EN
);
    always @(posedge clk, posedge rst) begin
        if(rst) begin
            Dest <= 0;
            Src1 <= 0;
            Src2 <= 0;
            Reg2 <= 0;
            Val2 <= 0;
            Val1 <= 0;
            PC_out <= 0;
            Br_type <= 0;
            EXE_CMD <= 0;
            MEM_R_EN <= 0;
            MEM_W_EN <= 0;
            WB_EN <= 0;
        end
        else if (flush) begin
            Dest <= 0;
            Src1 <= 0;
            Src2 <= 0;
            Reg2 <= 0;
            Val2 <= 0;
            Val1 <= 0;
            PC_out <= 0;
            Br_type <= 0;
            EXE_CMD <= 0;
            MEM_R_EN <= 0;
            MEM_W_EN <= 0;
            WB_EN <= 0;
        end
        else begin
            Dest <= Dest_in;
            Src1 <= Src1_in;
            Src2 <= Src2_in;
            Reg2 <= Reg2_in;
            Val2 <= Val2_in;
            Val1 <= Val1_in;
            PC_out <= PC_in;
            Br_type <= Br_type_in;
            EXE_CMD <= EXE_CMD_in;
            MEM_R_EN <= MEM_R_EN_in;
            MEM_W_EN <= MEM_W_EN_in;
            WB_EN <= WB_EN_in;
        end
    end
endmodule
