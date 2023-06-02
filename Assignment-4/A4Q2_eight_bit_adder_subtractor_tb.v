`timescale 1ms/1ns
`include "exam.v"

module four_bit_adder_subtractor_tb;
   
   

   reg signed [3:0] A;
   reg signed [3:0] B;
   reg option;

   wire signed [3:0] sum;


   four_bit_adder_subtractor ADDER (A, B, option, sum);
   
   initial begin
       $dumpfile("A4Q2.vcd");
       $dumpvars(1, four_bit_adder_subtractor_tb);
       $display("time\t A\t B\t option\t Sum");
       $monitor("%g\t %d\t %d\t %b\t %d\t %b", $time, A, B, option, sum);

       #5 A=0; B=0; opcode=0;
       #5 A=1; B=0; opcode=1;
       #5 A=0; B=1; opcode=1;
       #5 A=1; B=1; opcode=0;
       #5 A=-126; B=-125; opcode=1;
       #5 A=-128; B=0; opcode=1;
       #5 A=40; B=40; opcode=1;
       #5 A=127; B=127; opcode=0;
       #5 A=-128; B=1; opcode=1;
       #5 A=30; B=0; opcode=0;
       #5 A=-40; B=-6; opcode=0;
       #5 A=-100; B=100; opcode=1;
       #5 A=40; B=20; opcode=1;
       #5 A=120; B=-3; opcode=1;
       #5 A=1; B=2; opcode=1;
         
   end

endmodule