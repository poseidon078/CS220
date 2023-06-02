module eight_to_three_priority_encoder(x, f);
    
    input  wire [7:0] x;
    
    output wire [2:0] f;

    assign f[0] = ~(x[0] | (~x[1] & (x[2] | (~x[3] & x[4]) | (~x[3] & ~x[5] & x[6]))));
    assign f[1] = ~(x[0] | x[1] | (~x[2] & ~x[3] & (x[5] | x[4])));
    assign f[2] = ~(x[0] | x[1] | x[2] | x[3]);
    
endmodule