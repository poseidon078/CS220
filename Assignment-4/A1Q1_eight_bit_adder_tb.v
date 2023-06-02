`timescale 1ms/1ns
`include "A1Q1_eight_bit_adder_subtractor.v"

module eight_bit_adder_subtractor_tb;
   
   

   reg signed [7:0] A;
   reg signed [7:0] B;
   reg       opcode;

   wire signed [7:0] sum;
   wire       carry_out;

   eight_bit_adder ADDER (A, B, opcode, sum, carry_out);
   
   initial begin
       $dumpfile("A1Q1.vcd");
       $dumpvars(1, eight_bit_adder_tb);
       $display("time\t A\t B\t opcode\t Sum\t C_out");
       $monitor("%g\t %d\t %d\t %b\t %d\t %b", $time, A, B, opcode, sum, carry_out);

       #5 A=0; B=0; opcode=0;
       #5 A=1; B=0; opcode=1;
       #5 A=0; B=1; opcode=1;
       #5 A=1; B=1; opcode=0;
       #5 A=126; B=1; opcode=1;
       #5 A=-128; B=0; opcode=0;
       #5 A=40; B=40; opcode=1;
       #5 A=0; B=127; opcode=0;
       #5 A=127; B=0; opcode=1;
       #5 A=30; B=0; opcode=0;
       #5 A=-40; B=-6; opcode=0;
       #5 A=-100; B=100; opcode=1;
       #5 A=40; B=20; opcode=1;
       #5 A=120; B=-3; opcode=1;
       #5 A=1; B=2; opcode=1;
         
   end

endmodule