module EXE_Stage(
        input clk,
        
        input [3:0] EXE_CMD,
        input [31:0] val1,
        input [31:0] val2,
        input [31:0] val_src2,
        input [1:0] Br_type,
        input [31:0] PC,
        input [1:0] val1_forward_sel,
        input [1:0] val2_forward_sel,
        input [1:0] val3_forward_sel,

        output [31:0] ALU_result,
        output [31:0] Br_Addr,
        output Br_taken,
        output flush,
        output [31:0] ST_value
);
//     Adder adder(
        //     .val1(PC),
        //     .val2(val2),
        //     .result(Br_Addr)
//     );
    wire [31:0] forwarded_val1, forwarded_val2;

    assign flush = Br_taken;

    assign Br_Addr = PC + forwarded_val2;

    assign forwarded_val1 = (val1_forward_sel == 2'b01) ? mem_forward :
                            (val1_forward_sel == 2'b10) ? wb_forward :
                            val1;

    assign forwarded_val2 = (val2_forward_sel == 2'b01) ? mem_forward :
                            (val2_forward_sel == 2'b10) ? wb_forward :
                            val2;

    assign ST_value = (val3_forward_sel == 2'b01) ? mem_forward :
                      (val3_forward_sel == 2'b10) ? wb_forward :
                      val_src2;

    Condition_Check condition_check(
            .val1(forwarded_val1),
            .val2(ST_value),
            .branch_type(Br_type),
            .branch_taken(Br_taken)
    );

    ALU alu(
            .in1(forwarded_val1),
            .in2(forwarded_val2),
            .cmd(EXE_CMD),
            .result(ALU_result)
    );

endmodule
