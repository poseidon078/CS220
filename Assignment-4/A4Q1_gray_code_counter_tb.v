`include "A4Q1_gray_code_counter.v"

module gray_code_counter_tb();
    reg clk;
    reg clear;
    wire op;

    gray_code_counter m0(clk, op, clear);

    always begin
        #5 clk  = ~clk;
    end

    initial begin
        $dumpfile("A4Q1.vcd");
        $dumpvars(1, gray_code_counter_tb);

        $display("time\t clear\t  op");
        $monitor("%g\t %b\t %b", $time, clear, op);

        clk = 0;
        clear = 1;
        #10 clear = 0;
        #400 $finish;
    end
endmodule