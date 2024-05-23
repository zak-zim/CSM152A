module StopController(clk, counterClk, adjClk, adj, pause, sel, reset, min, sec, blink);

input clk;
input counterClk;
input adjClk;
input adj;
input pause;
input sel;
input reset;
output reg [5:0] min = 0;
output reg [5:0] sec = 0;
output reg blink = 0;

reg [1:0] state = 0;
reg [1:0] state_d = 0;

reg [1:0] pauseSR = {1'b0,1'b0};
reg [1:0] resetSR = {1'b0, 1'b0};
reg rst = 0;

reg [5:0] min_d = 0;
reg [5:0] sec_d = 0;

parameter RUN = 0;
parameter SET = 1;
parameter PAUSE = 2;
//parameter RESET = 3;

always@ (*) begin
    case(state)
        RUN: begin
            if(resetSR == 2'b10) begin
                rst = 1;
            end
            if(pauseSR == 2'b10) begin
                state_d = PAUSE;
            end else if (adj) begin
                state_d = SET;
            end else begin
                state_d = RUN;
                sec_d = sec + 1;
                if(sec_d > 6'b111011) begin
                    sec_d = sec_d - 6'b111011;
                    if(min_d >= 6'b111011) begin
                        min_d = 6'b111011;
                    end else begin
                        min_d = min + 1;
                    end
                end else begin
                    min_d = min;
                end
            end
        end
        SET: begin
            if(resetSR == 2'b10) begin
                rst = 1;
            end
            if(pauseSR == 2'b10) begin
                state_d = PAUSE;
                blink = 0;
            end else if(~adj) begin
                state_d = RUN;
                blink = 0;
            end else begin
                state_d = SET;
                blink = 1;
                if(sel) begin
                    sec_d = sec + 1;
                    if(sec_d > 6'b111011) begin
                        sec_d = 6'b000000;
                    end
                end else begin
                    sec_d = sec;
                    if(min_d > 6'b111011) begin
                        min_d = 6'b000000;
                    end else begin
                        min_d = min + 1;
                    end
                end
            end
        end
        PAUSE: begin
            if(resetSR == 2'b10) begin
                rst = 1;
            end
            if((pauseSR == 2'b10) && adj) begin
                state_d = SET;
            end else if((pauseSR == 2'b10) && ~adj) begin
                state_d = RUN;
            end else begin
                state_d = PAUSE;
                sec_d = sec;
                min_d = min;
            end
        end
        default: begin
            state_d = RUN;
        end
    endcase
end

always@ (posedge clk) begin
    pauseSR <= { pauseSR[0], pause };
    resetSR <= { resetSR[0], reset };
    if(rst) begin
//    if(state == RESET) begin
        sec <= 6'b000000;
        min <= 6'b000000;
        rst <= 0;
//    end
    end
    state <= state_d;
end

always@ (posedge counterClk) begin
    if(state == RUN) begin
        sec <= sec_d;
        min <= min_d;
    end
end

always@ (posedge adjClk) begin
    if(state == SET) begin
        sec <= sec_d;
        min <= min_d;
    end
end

endmodule
