`timescale 1ms/1ns
`include "A1Q4_eight_to_three_priority_encoder.v"

module eight_to_three_priority_encoder_tb();

    reg  [7:0] x;
    wire [2:0] f;

    eight_to_three_priority_encoder m0(.x(x),
                                       .f(f)); 

    initial begin
        $dumpfile("A1Q4.vcd");
        $dumpvars(1, eight_to_three_priority_encoder_tb);

        $display("time\t x\t f");
        $monitor("%g\t %b\t %b", $time, x, f);

        #5 x = 8'b10001011;
        #5 x = 8'b01100010;
        #5 x = 8'b01000100;  
        #5 x = 8'b01001000;
        #5 x = 8'b11010000;
        #5 x = 8'b10100000;
        #5 x = 8'b01000000;
        #5 x = 8'b10000000;
        #5 $finish;                
    end

endmodule
