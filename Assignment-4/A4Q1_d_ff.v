module d_ff(clk, clear, d, q);
    
    input  wire  clk;
    input  wire  clear;
    input  wire  d;
    output reg   q;

    always@(clear or posedge clk)
    begin
        if(clear) begin
            q <= 0;
        end
        else begin
            q <= d;
        end
    end

endmodule