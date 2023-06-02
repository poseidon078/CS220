module look_ahead_adder(A, B, Cm1, sum, C8);

    // Input 
    input wire[7:0] A;
    input wire[7:0] B;
    input wire Cm1;

    // Output
    output wire[7:0] sum;
    output wire C8;

    // Intermediate values 
    wire[7:0] G;
    wire[7:0] P;
    wire[7:0] C;

    assign G[0] = A[0]&B[0];
    assign P[0] = A[0]^B[0];

    assign G[1] = A[1]&B[1];
    assign P[1] = A[1]^B[1];

    assign G[2] = A[2]&B[2];
    assign P[2] = A[2]^B[2];

    assign G[3] = A[3]&B[3];
    assign P[3] = A[3]^B[3];

    assign G[4] = A[4]&B[4];
    assign P[4] = A[4]^B[4];

    assign G[5] = A[5]&B[5];
    assign P[5] = A[5]^B[5];

    assign G[6] = A[6]&B[6];
    assign P[6] = A[6]^B[6];

    assign G[7] = A[7]&B[7];
    assign P[7] = A[7]^B[7];

    // Implement Look ahead adder logic for faster speed
    assign C[0] = (G[0]) | ( P[0]&Cm1);
    assign C[1] = (G[1]) | (P[1]&G[0]) | (P[1]&P[0]&Cm1);
    assign C[2] = (G[2]) | (P[2]&G[1]) | (P[2]&P[1]&G[0]) | (P[2]&P[1]&P[0]&Cm1);
    assign C[3] = (G[3]) | (P[3]&G[2]) | (P[3]&P[2]&G[1]) | (P[3]&P[2]&P[1]&G[0]) | (P[3]&P[2]&P[1]&P[0]&Cm1);
    assign C[4] = (G[4]) | (P[4]&G[3]) | (P[4]&P[3]&G[2]) | (P[4]&P[3]&P[2]&G[1]) | (P[4]&P[3]&P[2]&P[1]&G[0]) | (P[4]&P[3]&P[2]&P[1]&P[0]&Cm1);
    assign C[5] = (G[5]) | (P[5]&G[4]) | (P[5]&P[4]&G[3]) | (P[5]&P[4]&P[3]&G[2]) | (P[5]&P[4]&P[3]&P[2]&G[1]) | (P[5]&P[4]&P[3]&P[2]&P[1]&G[0]) | (P[5]&P[4]&P[3]&P[2]&P[1]&P[0]&Cm1);
    assign C[6] = (G[6]) | (P[6]&G[5]) | (P[6]&P[5]&G[4]) | (P[6]&P[5]&P[4]&G[3]) | (P[6]&P[5]&P[4]&P[3]&G[2]) | (P[6]&P[5]&P[4]&P[3]&P[2]&G[1]) | (P[6]&P[5]&P[4]&P[3]&P[2]&P[1]&G[0]) | (P[6]&P[5]&P[4]&P[3]&P[2]&P[1]&P[0]&Cm1);
    assign C[7] = (G[7]) | P[7]&((G[6]) | (P[6]&G[5]) | (P[6]&P[5]&G[4]) | (P[6]&P[5]&P[4]&G[3]) | (P[6]&P[5]&P[4]&P[3]&G[2]) | (P[6]&P[5]&P[4]&P[3]&P[2]&G[1]) | (P[6]&P[5]&P[4]&P[3]&P[2]&P[1]&G[0]) | (P[6]&P[5]&P[4]&P[3]&P[2]&P[1]&P[0]&Cm1));

    // Logic for getting the sum bits after generating the carry bits
    assign sum[0] = A[0] ^ B[0] ^ Cm1;
    genvar i;
    for(i=1; i<8; i=i+1) begin
        assign sum[i] = A[i] ^ B[i] ^ C[i-1];
    end

    // Logic for the overflow (carryout) bit
    assign C8 = A[7]&B[7] | A[7]&C[7] | B[7]&C[7] | A[7]&B[7]&C[7];

endmodule