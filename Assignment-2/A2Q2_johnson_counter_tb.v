`include "A2Q2_johnson_counter.v"

module johnson_counter_tb();

    reg       clk;
    reg       clear;
    wire [7:0] y;

    johnson_counter m0(clk, clear, y);

    always begin
        #5 clk = ~clk;
    end

    initial begin
        $dumpfile("A2Q2.vcd");
        $dumpvars(1, johnson_counter_tb);

        $display("time\t clear\t y");
        $monitor("%g\t %b\t %b\t", $time, clear, y);

        clk = 0;
        clear = 1;
        #5 clear = 0;          
        #200 $finish;                
    end

endmodule