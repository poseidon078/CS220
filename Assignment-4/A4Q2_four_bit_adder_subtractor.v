`include "A4Q2_one_bit_full_adder_subtractor.v"

module A4Q2_four_bit_adder_subtractor (x, y, option, sum, C_out);

   input wire [3:0] x;
   input wire [3:0] y;
   input wire       option;

   output wire [3:0] sum;
   output wire       carry_out;
   output wire       C_out;

   wire [2:0] carry_over;

   one_bit_full_adder_subtractor FA0 (x[0], y[0], option, option, sum[0], carry_over[0]);
   one_bit_full_adder_subtractor FA1 (x[1], y[1], carry_over[0], option, sum[1], carry_over[1]);
   one_bit_full_adder_subtractor FA2 (x[2], y[2], carry_over[1], option, sum[2], carry_over[2]);
   one_bit_full_adder_subtractor FA3 (x[3], y[3], carry_over[2], option, sum[3], carry_out);   
   assign C_out = (x[3] & (y[3] ^ option) & ~sum[3]) | (~x[3] & (~(y[3] ^ option)) & sum[3]);
endmodule