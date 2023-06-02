`include "A1Q1_eight_bit_adder.v"
module eight_bit_adder_top;

   reg [7:0] A;
   reg [7:0] B;
   reg carry_in;

   wire [7:0] sum;
   wire carry_out;

   eight_bit_adder ADDER (A, B, carry_in, sum, carry_out);
   
   integer sumi;
   always @( sum )
    sumi = sum;
   
   initial begin
       $dumpfile("A1Q1_eight_bit_adder_top.vcd");
       $dumpvars(1, eight_bit_adder_top);
       $monitor("<%g>: A=%b, B=%b, Carry_in = %b, Sum= %d, Carry_out=%b", $time, A, B, carry_in, sumi, carry_out);
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