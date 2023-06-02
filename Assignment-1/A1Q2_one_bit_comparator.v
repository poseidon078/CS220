module one_bit_comparator( a, b, less, equal, greater);

    // a and b are the input bits
    input a;
    input b;

    // Outputs
    output wire less;
    output wire equal;
    output wire greater;

    // Combinational Logic 
    assign less = ~a & b;
    assign equal = ~(a^b);
    assign greater = a & ~b;

endmodule