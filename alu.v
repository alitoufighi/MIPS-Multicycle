// module ALU(
//     input [31:0] in1,
//     input [31:0] in2,
//     input [3:0] cmd,
    
//     output [31:0] result
// );
//     assign result = (cmd==4'b0000) ? in1 + in2 :
//                     (cmd==4'b0010) ? in1 - in2 :
//                     (cmd==4'b0100) ? in1 & in2 :
//                     (cmd==4'b0101) ? in1 | in2 :
//                     (cmd==4'b0110) ? ~(in1 | in2) :
//                     (cmd==4'b0111) ? in1 ^ in2 :
//                     (cmd==4'b1000) ? in1 << in2 :
//                     (cmd==4'b1001) ? $signed($signed(in1) >>> in2) :
//                     (cmd==4'b1010) ? in1 >> in2 :
//                     32'b0;
// endmodule
