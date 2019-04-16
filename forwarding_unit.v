module Forwarding_Unit(
    input [31:0] src1,
    input [31:0] src2,
    input [31:0] src3,

    input [4:0] MEM_Dest,
    input MEM_WB_EN,

    input [4:0] WB_Dest,
    input WB_WB_EN,

    input forwarding_enable,

    output [1:0] val1_forward_sel,
    output [1:0] val2_forward_sel,
    output [1:0] val3_forward_sel
);

    assign val1_forward_sel = (forwarding_enable == 1'b0) ? 2'b0 :
                              (MEM_Dest == src1 & MEM_WB_EN) ? 2'b01 :
                              (WB_Dest == src1 & WB_WB_EN) ? 2'b10 :
                              2'b0;
    
    assign val2_forward_sel = (forwarding_enable == 1'b0) ? 2'b0 :
                              (MEM_Dest == src2 & MEM_WB_EN) ? 2'b01 :
                              (WB_Dest == src2 & WB_WB_EN) ? 2'b10 :
                              2'b0;
    
    assign val3_forward_sel = (forwarding_enable == 1'b0) ? 2'b0 :
                              (MEM_Dest == src3 & MEM_WB_EN) ? 2'b01 :
                              (WB_Dest == src3 & WB_WB_EN) ? 2'b10 :
                              2'b0;

endmodule