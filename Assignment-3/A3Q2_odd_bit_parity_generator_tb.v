`include "A3Q2_odd_bit_parity_generator.v"

module parity_generator_tb();
    reg clk;
    reg reset;
    reg in;
    wire op;

    parity_generator m0(clk, reset, in, op);

    always begin
        #5 clk = ~clk;
    end

    initial begin
        $dumpfile("A3Q2.vcd");
        $dumpvars(1, parity_generator_tb);

        $display("time\t reset\t in\t op");
        $monitor("%g\t %b\t %b\t %b", $time, reset, in, op);

        clk = 0;
        reset = 1;
        reset = 0;

        // Input 1
        #5 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10
        #10 in = 1;
        #10 in = 0;
        #10 in = 0;
        #10

        #5

        // Input 2
        #5 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10
        #10 in = 1;
        #10 in = 0;
        #10 in = 0;
        #10

        #5

        // Input 3
        #5 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 
        #10 in = 1;
        #10 in = 0;
        #10 in = 0;
        #10
        #10 in = 1;
        #10 in = 0;
        #10 in = 0;
        #10

        #5

        // Input 4
        #5 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 
        #10 in = 1;
        #10 in = 1;
        #10 in = 1;
        #10
        #10 in = 1;
        #10 in = 0;
        #10 in = 0;
        #10

        #5

        // Input 5
        #5 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10
        #10 in = 1;
        #10 in = 0;
        #10 in = 0;
        #10

        #5

        // Input 6
        #5 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10

        #5

        // Input 7
        #5 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10

        #5

        // Input 8
        #5 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10
        #10 in = 1;
        #10 in = 0;
        #10 in = 0;
        #10

        #5

        // Input 9
        #5 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10
        #10 in = 0;
        #10 in = 0;
        #10 in = 0;
        #10

        #5

        // Input 10
        #5 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10
        #10 in = 1;
        #10 in = 1;
        #10 in = 1;
        #10


        #5

        // Input 11
        #5 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10

        #5

        // Input 12
        #5 in = 0;
        #10 in = 1;
        #10 in = 1;
        #10 
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10
        #10 in = 1;
        #10 in = 0;
        #10 in = 0;
        #10

        #5

        // Input 13
        #5 in = 0;
        #10 in = 1;
        #10 in = 1;
        #10 
        #10 in = 0;
        #10 in = 0;
        #10 in = 0;
        #10
        #10 in = 1;
        #10 in = 0;
        #10 in = 0;
        #10

        #5

        // Input 14
        #5 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 
        #10 in = 0;
        #10 in = 0;
        #10 in = 1;
        #10
        #10 in = 1;
        #10 in = 0;
        #10 in = 0;
        #10


        #5

        // Input 15
        #5 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 
        #10 in = 0;
        #10 in = 0;
        #10 in = 1;
        #10
        #10 in = 0;
        #10 in = 1;
        #10 in = 1;
        #10

        #5 $finish;
    end

endmodule