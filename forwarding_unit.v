module Forwarding_Unit(
    input [4:0] src1,
    input [4:0] src2,
    input [4:0] src3,

    input [4:0] MEM_Dest,
    input MEM_WB_EN,

    input [4:0] WB_Dest,
    input WB_WB_EN,

    input forwarding_enable,
    input if_store_bne,
    input MEM_R_EN, 

    output [1:0] val1_forward_sel,
    output [1:0] val2_forward_sel,
    output [1:0] val3_forward_sel
);

    assign val1_forward_sel = (~forwarding_enable)             ? 2'b0 :
                              (if_store_bne & (MEM_Dest == src1) & MEM_WB_EN) ? 2'b01 :
                              (if_store_bne & (WB_Dest == src1) & WB_WB_EN) ? 2'b10 :
                              ((MEM_Dest == src1) & MEM_WB_EN) ? 2'b01 :
                              ((WB_Dest == src1) & WB_WB_EN)   ? 2'b10 :
                              2'b0;

    assign val2_forward_sel = (~forwarding_enable)             ? 2'b0 :
                              (if_store_bne) ? 2'b0 :
                              ((MEM_Dest == src2) & MEM_WB_EN) ? 2'b01 :
                              ((WB_Dest == src2) & WB_WB_EN)   ? 2'b10 :
                              2'b0;
    
    assign val3_forward_sel = (~forwarding_enable)             ? 2'b0 :
                              (if_store_bne & (MEM_Dest == src2) & MEM_WB_EN) ? 2'b01 :
                              (if_store_bne & (WB_Dest == src2) & WB_WB_EN) ? 2'b10 :
                              // (if_store_bne & MEM_R_EN & (src2 == MEM_Dest)) ? 2'b11 :
                              2'b0;

endmodule