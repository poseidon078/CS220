`include "A4Q1_d_ff.v"
module gray_code_counter(clk, op, clear);
    input wire clk;
    input wire clear;
    output reg op;

    wire [2:0] state;
    wire dA;
    wire dB;
    wire dC;

    assign dA = (state[2] & state[0]) | (~state[0] & state[1]);
    assign dB = (~state[2] & state[0]) | (~state[0] & state[1]);
    assign dC = (~state[2] & ~state[1]) | (state[2] & state[1]);

    d_ff mA(clk, clear, dA, state[2]);
    d_ff mB(clk, clear, dB, state[1]);
    d_ff mC(clk, clear, dC, state[0]);

    always @(posedge clk) begin
        op <= ~state[0] & ~state[1] & ~state[2];
    end


endmodule