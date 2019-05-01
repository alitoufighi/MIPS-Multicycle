`timescale 1ns/1ns
module Hazard_Detection_Unit(
    input [4:0] src1,
    input [4:0] src2,

    input [4:0] EXE_Dest,
    input EXE_WB_EN,

    input [4:0] MEM_Dest,
    input MEM_R_EN,
    input MEM_WB_EN,

    input forwarding_enable, 
    input single_src,

    output reg hazard_detected
);
    always @(*) begin
        if(forwarding_enable) begin
            if(MEM_R_EN) begin
                hazard_detected = (src1 == EXE_Dest);
                if(~single_src) begin
                    hazard_detected = hazard_detected | (src2 == EXE_Dest);
                end
            end
            else begin
                hazard_detected = 0;
            end
        end
        else begin
            hazard_detected = 0;
            if (MEM_WB_EN) begin
                hazard_detected = (MEM_Dest == src1);
                if(~single_src)
                    hazard_detected = (hazard_detected | (MEM_Dest == src2));
            end
            if (EXE_WB_EN) begin
                hazard_detected = (EXE_Dest == src1);
                if (~single_src)
                    hazard_detected = (hazard_detected | (EXE_Dest == src2));
            end
        end
    end
endmodule
