module Hazard_Detection_Unit(
    input single_src,
    input [4:0] src1,
    input [4:0] src2,

    input [4:0] EXE_Dest,
    input EXE_WB_EN,

    input [4:0] MEM_Dest,
    input MEM_R_EN,
    input MEM_WB_EN,

    input forwarding_enable, 

    output reg hazard_detected
);
    always @(*) begin
        hazard_detected = 0;
        if (forwarding_enable) begin
            if(MEM_R_EN & MEM_WB_EN) begin
                hazard_detected = ((MEM_Dest == src1) | (MEM_Dest == src2));
            end
        end
        else begin
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
