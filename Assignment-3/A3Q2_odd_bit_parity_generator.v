module parity_generator(clk, reset, in, op);

    input  wire clk;
    input  wire reset;
    input  wire in;
    output reg  op; 

    parameter SIZE = 3;
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101, S6 = 3'b110;
    reg [SIZE-1:0] state;

    always @(posedge clk or reset) begin
        
        if(reset == 1'b1) begin
            state <= S0;
            op <= 1'bz;
        end

        else begin
            case(state)
                S0: if(in == 1'b0) begin
                        state <= S2;
                        op <= 1'bz;
                    end
                    else begin
                        state <= S1;
                        op <= 1'bz;
                    end

                S1: if(in == 1'b0) begin
                        state <= S3;
                        op <= 1'bz;
                    end
                    else begin
                        state <= S4;
                        op <= 1'bz;
                    end
                
                S2: if(in == 1'b0) begin
                        state <= S4;
                        op <= 1'bz;
                    end
                    else begin
                        state <= S3;
                        op <= 1'bz;
                    end
                
                S3: if(in == 1'b0) begin
                        state <= S5;
                        op <= 1'bz;
                    end
                    else begin
                        state <= S6;
                        op <= 1'bz;
                    end
                S4: if(in == 1'b0) begin
                        state <= S6;
                        op <= 1'bz;
                    end
                    else begin 
                        state <= S5;
                        op <= 1'bz;
                    end
                
                S5: begin
                        state <= S0;
                        op <= 1'b1;
                    end
                
                S6: begin
                        state <= S0;
                        op <= 1'b0;
                    end 

                default: state <= S0;
            endcase
        end
    end

endmodule



            
