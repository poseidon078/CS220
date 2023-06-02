`include "A3Q1_sequence_detector.v"

module sequence_detector_tb();

    reg clk;
    reg reset;
    reg in;
    wire op;

    sequence_detector m0(clk, reset, in, op);

    always begin
        #5 clk = ~clk;
    end

    initial begin
        $dumpfile("A3Q1.vcd");
        $dumpvars(1, sequence_detector_tb);

        $display("time\t reset\t in\t op");
        $monitor("%g\t %b\t %b\t %b", $time, reset, in, op);

        clk = 0;
        reset = 1;
        #5 reset = 0;
        
        // Input-1
        #10 in = 0;
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;

        #5 reset = 1;
        #5 reset = 0;

         // Input-2
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;

        #5 reset = 1;
        #5 reset = 0;

         // Input-3
        #10 in = 1;
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;

        #5 reset = 1;
        #5 reset = 0;

         // Input-4
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;

        #5 reset = 1;
        #5 reset = 0;

         // Input-5
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;


        #5 reset = 1;
        #5 reset = 0;

         // Input-6
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;

        #5 reset = 1;
        #5 reset = 0;

         // Input-7
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;

        #5 reset = 1;
        #5 reset = 0;

         // Input-8
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 0;
        #10 in = 1;
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;


        #5 reset = 1;
        #5 reset = 0;

         // Input-9
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 1;


        #5 reset = 1;
        #5 reset = 0;

         // Input-10
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 0;
        #10 in = 0;

        #5 reset = 1;
        #5 reset = 0;

         // Input-11
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 0;
        #10 in = 0;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;


        #5 reset = 1;
        #5 reset = 0;

         // Input-12
        #10 in = 1;
        #10 in = 0;
        #10 in = 0;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;

        #5 reset = 1;
        #5 reset = 0;

         // Input-13
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;

        #5 reset = 1;
        #5 reset = 0;

         // Input-14
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 0;
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 0;

        #5 reset = 1;
        #5 reset = 0;

         // Input-15
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 0;
        #10 in = 1;
        #10 in = 1;
        #10 in = 1;
        #10 in = 1;

        #5 $finish;                
    end

endmodule