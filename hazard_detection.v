module Hazard_Detection_Unit(
    input single_src,
    input [4:0] src1,
    input [4:0] src2,
    input [4:0] Exe_Dest,
    input Exe_WB_EN,
    input [4:0] Mem_Dest,
    input Mem_WB_En,
    
    output hazard_detected
);
    always @(*) begin
        if(Mem_WB_En) begin
            hazard_detected = (Mem_Dest == src1);
            if(~single_src)
                hazard_detected = (hazard_detected | (Mem_Dest == src2));
        end
        if(Exe_WB_EN) begin
            hazard_detected = (Exe_Dest == src1);
            if(~single_src)
                hazard_detected = (hazard_detected | (Exe_Dest == src2));
        end
    end
endmodule
