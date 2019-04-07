// module Condition_Check(
//     input [31:0] val1,
//     input [31:0] val2,
//     input [1:0] branch_type,

//     output branch_taken 
// );
//     assign branch_taken = (branch_type==2'b01) ? val1 == 32'b0 :
//                           (branch_type==2'b10) ? val1 != val2 :
//                           (branch_type==2'b11) ? 1'b1 :
//                           1'b0;
// endmodule
