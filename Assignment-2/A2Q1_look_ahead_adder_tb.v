`include "A2Q1_look_ahead_adder.v"

module look_ahead_adder_tb;

    // Input
    reg[7:0] A;
    reg[7:0] B;
    reg Cm1;

    // Output
    wire[7:0] sum;
    wire C8;

    // Instantiate the Look Ahead Adder 
    look_ahead_adder ADDER(.A(A), .B(B), .Cm1(Cm1), .sum(sum), .C8(C8));

    initial begin
        // files for helping with gtkwave visualization
        $dumpfile("A2Q1.vcd");
        $dumpvars(1, look_ahead_adder_tb);

        // displaying the values in a proper format
        $display("time\t A\t B\t sum\t carryout");
        $monitor("%g\t %d\t %d\t %d\t %b\t", $time, A, B, sum, C8);

        #5 A = 1; B = 1; Cm1 = 0;
        #5 A = 10; B = 21; Cm1 = 0;
        #5 A = 131; B = 101; Cm1 = 0;
        #5 A = 25; B = 10; Cm1 = 0;
        #5 A = 42; B = 145; Cm1 = 0;
        #5 A = 27; B = 1; Cm1 = 0;
        #5 A = 28; B = 26; Cm1 = 0;
        #5 A = 33; B = 69; Cm1 = 0;
        #5 A = 169; B = 5; Cm1 = 0;
        #5 A = 100; B = 99; Cm1 = 0;
        #5 A = 125; B = 155; Cm1 = 0;
        #5 A = 111; B = 64; Cm1 = 0;
        #5 A = 128; B = 39; Cm1 = 0;
        #5 A = 100; B = 100; Cm1 = 0;
        #5 A = 255; B = 255; Cm1 = 0;

    end

endmodule