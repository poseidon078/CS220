module one_bit_full_adder_subtractor (a, b, carry_in, opcode, sum, carry_out);

   input wire a;
   input wire b;
   input wire carry_in;
   input wire opcode;
   
   output wire sum;
   output wire carry_out;

   assign sum =  a ^ (opcode^b) ^ carry_in;
   assign carry_out = (a & (opcode^b)) | ((opcode^b) & carry_in) | (a & carry_in);

endmodule