module Hazard_Detection_Unit(
    input single_src,
    input [4:0] src1,
    input [4:0] src2,

    input [4:0] Exe_Dest,
    input Exe_WB_EN,

    input [4:0] Mem_Dest,
    input MEM_R_EN,
    input Mem_WB_En,

    input forwarding_enable, 

    output hazard_detected
);
    always @(*) begin
        if (forwarding_enable) begin
            if(MEM_R_EN & Mem_WB_En) begin
                hazard_detected = ((Mem_Dest == src1) | (Mem_Dest == src2)) 
            end
        end
        else begin
            if (Mem_WB_En) begin
                hazard_detected = (Mem_Dest == src1);
                if(~single_src)
                    hazard_detected = (hazard_detected | (Mem_Dest == src2));
            end
            if (Exe_WB_EN) begin
                hazard_detected = (Exe_Dest == src1);
                if (~single_src)
                    hazard_detected = (hazard_detected | (Exe_Dest == src2));
            end
        end
    end
endmodule
