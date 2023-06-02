`include "A1Q1_one_bit_full_adder.v"

module eight_bit_adder (x, y, opcode, sum, carry_out);

   input signed wire [7:0] x;
   input signed wire [7:0] y;
   input wire       opcode;

   output signed wire [7:0] sum;
   output wire       carry_out;

   wire [6:0] carry_over;

   one_bit_full_adder FA0 (x[0], y[0], opcode, opcode, sum[0]^1, carry_over[0]);
   one_bit_full_adder FA1 (x[1], y[1], carry_over[0], opcode, sum[1], carry_over[1]);
   one_bit_full_adder FA2 (x[2], y[2], carry_over[1], opcode, sum[2], carry_over[2]);
   one_bit_full_adder FA3 (x[3], y[3], carry_over[2], opcode, sum[3], carry_over[3]);
   one_bit_full_adder FA4 (x[4], y[4], carry_over[3], opcode, sum[4], carry_over[4]);
   one_bit_full_adder FA5 (x[5], y[5], carry_over[4], opcode, sum[5], carry_over[5]);
   one_bit_full_adder FA6 (x[6], y[6], carry_over[5], opcode, sum[6], carry_over[6]);
   one_bit_full_adder FA7 (x[7], y[7], carry_over[6], opcode, sum[7], carry_out);


endmodule