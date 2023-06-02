`include "A1Q3_two_to_four_decoder.v"

module three_to_eight_decoder(x, f, en);

    input  wire [2:0] x;
    input  wire       en;
    
    output wire [7:0] f;

    wire w1;
    wire w2;

    assign w1 = en & x[2];
    assign w2 = en & ~x[2];

    two_to_four_decoder d0(.x(x[1:0]),
                           .f(f[7:4]),
                           .en(w1));

    two_to_four_decoder d1(.x(x[1:0]),
                           .f(f[3:0]),
                           .en(w2));
    
endmodule