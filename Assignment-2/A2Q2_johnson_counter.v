`include "A2Q2_d_ff.v"
module johnson_counter(clk, clear, y);
    
    input  wire      clk;
    input  wire      clear;
    output wire [7:0] y;
    
    wire q_bar;

    assign q_bar = ~y[0];
    d_ff q0(clk, clear, y[1], y[0]);
    d_ff q1(clk, clear, y[2], y[1]);
    d_ff q2(clk, clear, y[3], y[2]);
    d_ff q3(clk, clear, y[4], y[3]);
    d_ff q4(clk, clear, y[5], y[4]);
    d_ff q5(clk, clear, y[6], y[5]);
    d_ff q6(clk, clear, y[7], y[6]);
    d_ff q7(clk, clear, q_bar, y[7]);

endmodule