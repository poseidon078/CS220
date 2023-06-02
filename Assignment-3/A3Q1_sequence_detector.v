module sequence_detector(clk, reset, in, op);

    input  wire clk;
    input  wire reset;
    input  wire in;
    output reg  op; 

    parameter SIZE = 4;
    parameter S0 = 4'b0001, S1=4'b0010, S2=4'b0100, S3=4'b1000;

    reg [SIZE-1:0] state;

    always @(posedge clk) begin

        if(reset == 1'b1) begin
            state <= S0;
            op    <= 0;
        end 

        else begin
            case(state)
                S0: if(in == 1'b1) begin
                        state <= S1;
                        op    <= 0;
                    end
                    else begin
                        state <= S0;
                        op    <= 0;
                    end

                S1: if(in == 1'b1) begin
                        state <= S1;
                        op    <= 0;
                    end
                    else begin
                        state <= S2;
                        op    <= 0;
                    end

                S2: if(in == 1'b1) begin
                        state <= S3;
                        op    <= 0;
                    end
                    else begin
                        state <= S0;
                        op    <= 0;
                    end

                S3: if(in == 1'b1) begin
                        state <= S1;
                        op    <= 0;
                    end
                    else begin
                        state <= S2;
                        op    <= 1;
                    end

                default: state <= S0;
            endcase
        end
    end

endmodule