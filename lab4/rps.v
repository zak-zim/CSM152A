module rps(clk, move1, move2, result);

input clk;
input [1:0] move1; //either 0, 1, 2 same as parameter
input [1:0] move2;
output wire [1:0] result;

reg [1:0] res;
reg [1:0] result_d;

assign result = res;

parameter ROCK = 2'b00;
parameter PAPER = 2'b01;
parameter SCISSORS = 2'b10;

parameter NONE = 2'b00;
parameter P1WIN = 2'b01;
parameter P2WIN = 2'b10;
parameter TIE = 2'b11;

always@ (posedge clk) begin
    res <= result_d;
end

always@ (*) begin
    case(move1)
        ROCK: begin
            case(move2)
               ROCK:begin
                    result_d = TIE;
                end
                PAPER:begin
                    result_d = P2WIN;
                end
                SCISSORS:begin
                    result_d = P1WIN;
                end
                default: begin
                    result_d = NONE;
                end                 
            endcase
        end
        PAPER: begin
            case(move2)
                ROCK:begin
                    result_d = P1WIN;
                end
                PAPER:begin
                    result_d = TIE;
                end
                SCISSORS:begin
                    result_d = P2WIN;
                end
                default: begin
                    result_d = NONE;
                end                  
            endcase
        end
        SCISSORS: begin
            case(move2)
                ROCK:begin
                    result_d = P2WIN;
                end
                PAPER:begin
                    result_d = P1WIN;
                end
                SCISSORS:begin
                    result_d = TIE;
                end
                default: begin
                    result_d = NONE;
                end                  
            endcase
        end
        default: begin
            result_d = NONE;
        end  
    endcase
end

endmodule