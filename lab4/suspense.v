module suspense(clk, dv_clk, en, move1, move2, result, d1_out, d2_out, d3_out ,d4_out);

input clk;
input dv_clk;
input en;
input [1:0] move1;
input [1:0] move2;
input [1:0] result;
output [3:0] d1_out;
output [3:0] d2_out;
output [3:0] d3_out;
output [3:0] d4_out;

parameter P = 4'b0100;
parameter R = 4'b0101;
parameter S = 4'b0110;
parameter OFF = 4'b1111;
parameter ONE = 4'b0001;
parameter TWO = 4'b0010;
parameter ERR = 4'b1000;

reg [19:0] counter;
reg [19:0] counter_d;

reg [3:0] d1;
reg [3:0] d2;
reg [3:0] d3;
reg [3:0] d4;
reg [3:0] d1_d;
reg [3:0] d2_d;
reg [3:0] d3_d;
reg [3:0] d4_d;

assign d1_out = d1;
assign d2_out = d2;
assign d3_out = d3;
assign d4_out = d4;

reg [3:0] choice1;
reg [3:0] choice2;

always@ (posedge clk) begin
    d1 <= d1_d;
    d2 <= d2_d;
    d3 <= d3_d;
    d4 <= d4_d;
end

always@ (posedge dv_clk) begin
    counter <= counter_d;
end

always@ (*) begin
    case(move1)
        2'b00: begin
            choice1 = R;
        end
        2'b01: begin
            choice1 = P;
        end
        2'b10: begin
            choice1 = S;
        end
        2'b11: begin
            choice1 = ERR;
        end
    endcase
    case(move2)
        2'b00: begin
            choice2 = R;
        end
        2'b01: begin
            choice2 = P;
        end
        2'b10: begin
            choice2 = S;
        end
        2'b11: begin
            choice2 = ERR;
        end
    endcase
end

always@ (*) begin
    if(en) begin
        counter_d = counter + 1;
        if(counter < 10) begin
            d1_d = P;
            d2_d = ONE;
            d3_d = OFF;
            d4_d = choice1;
        end else if (counter < 20) begin
            d1_d = P;
            d2_d = TWO;
            d3_d = OFF;
            d4_d = choice2;
        end else begin
            case(result)
                2'b00: begin
                    d1_d = ERR;
                    d2_d = ERR;
                    d3_d = ERR;
                    d4_d = ERR;
                end
                2'b01: begin
                    d1_d = OFF;
                    d2_d = P;
                    d3_d = ONE;
                    d4_d = OFF;
                end
                2'b10: begin
                    d1_d = OFF;
                    d2_d = P;
                    d3_d = TWO;
                    d4_d = OFF;
                end
                2'b11: begin
                    d1_d = P;
                    d2_d = ONE;
                    d3_d = P;
                    d4_d = TWO;
                end
            endcase
        end
    end else begin
        counter_d = 0;
        d1_d = OFF;
        d2_d = OFF;
        d3_d = OFF;
        d4_d = OFF;
    end
end

endmodule
