`include "A1Q2_one_bit_comparator.v"

module eight_bit_comparator(A, B, less, equal, greater);

    // 8 bit input
    input [7:0] A;
    input [7:0] B;

    // Final outputs
    output wire less;
    output wire equal;
    output wire greater;

    // Intermediate values
    wire [7:0] l;
    wire [7:0] e;
    wire [7:0] g;

    // Instantiating the one bit comparators for each bit
    one_bit_comparator C0 (A[0], B[0], l[0], e[0], g[0]);
    one_bit_comparator C1 (A[1], B[1], l[1], e[1], g[1]);
    one_bit_comparator C2 (A[2], B[2], l[2], e[2], g[2]);
    one_bit_comparator C3 (A[3], B[3], l[3], e[3], g[3]);
    one_bit_comparator C4 (A[4], B[4], l[4], e[4], g[4]);
    one_bit_comparator C5 (A[5], B[5], l[5], e[5], g[5]);
    one_bit_comparator C6 (A[6], B[6], l[6], e[6], g[6]);
    one_bit_comparator C7 (A[7], B[7], l[7], e[7], g[7]);

    // Final combinational logic using intermediate values 
    assign equal = e[0] & e[1] & e[2] & e[3] & e[4] & e[5] & e[6] & e[7];
    assign greater = g[7] | (g[6] & e[7]) | (e[7] & e[6] & g[5]) | (e[7] & e[6] & e[5] & g[4]) | (e[7] & e[6] & e[5] & e[4] & g[3]) | (e[7] & e[6] & e[5] & e[4] & e[3] & g[2]) | (e[7] & e[6] & e[5] & e[4] & e[3] & e[2] & g[1]) | (e[7] & e[6] & e[5] & e[4] & e[3] & e[2] & e[1] & g[0]);
    assign less = ~greater & ~equal;

endmodule