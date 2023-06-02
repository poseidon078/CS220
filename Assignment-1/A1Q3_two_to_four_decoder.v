module two_to_four_decoder(x, f, en);

    input  wire  [1:0] x;
    input  wire        en;
    
    output wire  [3:0] f;


    assign f[0] = ~x[1] & ~x[0] & en;
    assign f[1] = ~x[1] &  x[0] & en;
    assign f[2] =  x[1] & ~x[0] & en;
    assign f[3] =  x[1] &  x[0] & en;


endmodule