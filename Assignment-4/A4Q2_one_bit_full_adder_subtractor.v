module one_bit_full_adder_subtractor (a, b, carry_in, option, sum, carry_out);

   input wire a;
   input wire b;
   input wire carry_in;
   input wire option;
   
   output wire sum;
   output wire carry_out;

   assign sum =  a ^ (option^b) ^ carry_in;
   assign carry_out = (a & (option^b)) | ((option^b) & carry_in) | (a & carry_in);

endmodule