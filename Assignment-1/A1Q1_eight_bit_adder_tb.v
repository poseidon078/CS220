`timescale 1ms/1ns
`include "A1Q1_eight_bit_adder.v"

module eight_bit_adder_tb;

   reg [7:0] A;
   reg [7:0] B;
   reg       carry_in;

   wire [7:0] sum;
   wire       carry_out;

   eight_bit_adder ADDER (A, B, carry_in, sum, carry_out);
   
   initial begin
       $dumpfile("A1Q1.vcd");
       $dumpvars(1, eight_bit_adder_tb);
       $display("time\t A\t B\t C_in\t Sum\t C_out");
       $monitor("%g\t %d\t %d\t %b\t %d\t %b", $time, A, B, carry_in, sum, carry_out);

       #5 A=0; B=0; carry_in=0;
       #5 A=1; B=0; carry_in=0;
       #5 A=0; B=1; carry_in=1;
       #5 A=1; B=1; carry_in=0;
       #5 A=128; B=128; carry_in=1;
       #5 A=250; B=250; carry_in=0;
       #5 A=40; B=40; carry_in=1;
       #5 A=0; B=128; carry_in=0;
       #5 A=255; B=0; carry_in=1;
       #5 A=30; B=0; carry_in=0;
       #5 A=40; B=6; carry_in=0;
       #5 A=200; B=200; carry_in=1;
       #5 A=40; B=20; carry_in=1;
       #5 A=220; B=250; carry_in=1;
       #5 A=1; B=2; carry_in=1;
         
   end

endmodule