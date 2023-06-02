`include "A4Q2_four_bit_adder_subtractor.v"

module exam(r, d, option, x);
    input wire [3:0] r;
    input wire [3:0] d;
    input wire option;

    output wire [3:0] x;


    A4Q2_four_bit_adder_subtractor A0(r, d, option, sum, carry_out);

    if(sum[3]&~option) begin
        assign x=r;
    end
    else begin
        assign x=r-d;
    end
endmodule