module Register_file_test();
    reg clk, rst;
    reg[4:0] src1, src2, dest;
    reg write_en;
    reg[31:0] write_value;
    wire[31:0] out1, out2;
    Registers_file reg_file(clk, rst, src1, src2, dest, write_value,
            write_en, out1, out2);

    initial begin
        #10 rst = 1;
        #10 rst = 0;

        #10 write_en = 1;
        dest = 0;
        write_value = 5;
        #10 clk = 1;
        #10 clk = 0;

        #10 write_en = 1;
        dest = 1;
        write_value = 5;
        #10 clk = 1;
        #10 clk = 0;

        #10 src1 = 20;
        #10 src2 = 30;

        #10 write_en = 1;
        dest = 20;
        write_value = 25;
        #10 clk = 1;
        #10 clk = 0;

        #10 clk = 1;
        #10 clk = 0;

    end
endmodule