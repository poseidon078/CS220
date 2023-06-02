`include "A1Q2_eight_bit_comparator.v"

module eight_bit_comparator_tb;

    // 8 bit Inputs 
    reg [7:0] A;
    reg [7:0] B;

    // Output 
    wire less;
    wire equal;
    wire greater;

    // Instantiating the comparator for tests
    eight_bit_comparator COMPARATOR(.A(A), .B(B), .less(less), .equal(equal), .greater(greater));

    initial begin
        // files for helping with gtkwave visualization
        $dumpfile("A1Q2.vcd");
        $dumpvars(1, eight_bit_comparator_tb);

        // displaying the values in a proper format
        $display("time\t A\t B\t less\t equal\t greater");
        $monitor("%g\t %d\t %d\t %b\t %b\t %b\t", $time, A, B, less, equal, greater);

        #5 A = 1; B = 1;
        #5 A = 10; B = 21;
        #5 A = 131; B = 101;
        #5 A = 25; B = 10;
        #5 A = 42; B = 145;
        #5 A = 27; B = 1;
        #5 A = 28; B = 26;
        #5 A = 33; B = 69;
        #5 A = 169; B = 5;
        #5 A = 100; B = 99;
        #5 A = 125; B = 155;
        #5 A = 111; B = 64;
        #5 A = 128; B = 39;
        #5 A = 100; B = 100;
        #5 A = 255; B = 255;

    end

endmodule