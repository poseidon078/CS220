`timescale 1ms/1ns

`include "A1Q3_three_to_eight_decoder.v"

module three_to_eight_decoder_tb();

    reg  [2:0] x;
    reg        en;
    wire [7:0] f;

    three_to_eight_decoder m0(.x(x),
                              .f(f), 
                              .en(en));

    initial begin
        $dumpfile("A1Q3.vcd");
        $dumpvars(1, three_to_eight_decoder_tb);

        $display("time\t en\t x\t f");
        $monitor("%g\t %b\t %b\t %b", $time, en, x, f);

        en = 0;
        #5 en= 1;
        #5 x = 3'b000;
        #5 x = 3'b001;
        #5 x = 3'b010;                 
        #5 x = 3'b011;                 
        #5 x = 3'b100;                 
        #5 x = 3'b101;
        #5 x = 3'b110;                 
        #5 x = 3'b111;                  
        #5 $finish;                
    end

endmodule
