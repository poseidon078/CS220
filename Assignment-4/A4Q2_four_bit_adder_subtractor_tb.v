`timescale 1ms/1ns
`include "exam.v"

module A4Q2_four_bit_adder_subtractor_tb;
   
   

   reg signed [3:0] A;
   reg signed [3:0] B;
   reg option;

   wire signed [3:0] sum;


   exam F (A, B, option, sum);
   
   initial begin
       $dumpfile("A4Q2.vcd");
       $dumpvars(1, A4Q2_four_bit_adder_subtractor_tb);
       $display("time\t A\t B\t option\t Sum");
       $monitor("%g\t %d\t %b\t %d\t%b", $time, A, B, option, sum);

       #5 A=0; B=0; option=0;
       #5 A=1; B=0; option=1;
       #5 A=0; B=1; option=1;
       #5 A=1; B=1; option=0;
       #5 A=3; B=2; option=1;
       #5 A=2; B=3; option=1;
         
   end

endmodule