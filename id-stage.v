module ID_Stage(
    input clk,
    input rst,

    input [31: 0] Instruction,
    input WB_Write_Enable,
    input [4:0] WB_Dest,
    input [31:0] WB_Data,
    input hazard_detected,

    output [4:0] Dest,
    output [4:0] Src1,
    output [4:0] Src2,
    output [31:0] Reg2,
    output [31:0] Val2,
    output [31:0] Val1,
    output [1:0] Br_type,
    output [3:0] EXE_CMD,
    output MEM_R_EN,
    output MEM_W_EN,
    output WB_EN,
    output single_src
);
    wire is_imm;
    wire [31:0] RegF1, RegF2;
    wire [31:0] sign_extended;

    assign Src1 = Instruction[25:21];
    assign Src2 = is_imm ? 32'b0 : Instruction[20:16];

    Control_unit cu(
            .opcode(Instruction[31:26]),

            .exec_cmd(EXE_CMD),
            .mem_r_en(MEM_R_EN),
            .mem_w_en(MEM_W_EN),
            .wb_en(WB_EN),
            .is_imm(is_imm),
            .branch_type(Br_type),
            .is_single_src(single_src)
    );

    {EXE_CMD, MEM_R_EN, MEM_W_EN, WB_EN, is_imm, Br_type, single_src} = (hazard_detected) ? 9'b0 : 
                                                                        {EXE_CMD, MEM_R_EN, MEM_W_EN, WB_EN, is_imm, Br_type, single_src};

    Registers_file reg_file(
            .clk(clk),
            .rst(rst),
            .src1(Src1),
            .src2(Src2),
            .dest(WB_Dest),
            .Write_Val(WB_Data),
            .Write_EN(WB_Write_Enable),
            .out1(RegF1),
            .out2(RegF2)
    );

    SignExtend sign_extend(
            .in(Instruction[15:0]),
            .out(sign_extended)
    );

    assign Val2 = is_imm ? sign_extended : RegF2;
    assign Val1 = RegF1;
    assign Reg2 = RegF2;
    assign Dest = is_imm ? Instruction[20:16] : Instruction[15:11];
endmodule
