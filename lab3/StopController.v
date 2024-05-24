module StopController(clk, counterClk, adjClk, adj, pause, reset, sel, minute, second, en);

input clk, counterClk, adjClk, adj, pause, reset, sel;
output wire [5:0] minute;
output wire [5:0] second;
output wire [1:0] en;

parameter RUN = 2'b00;
parameter SET = 2'b01;

parameter MAX = 6'b111100;

reg [1:0] state;
reg [1:0] state_d;

reg [5:0] min;
reg [5:0] sec;
reg [5:0] min_d;
reg [5:0] sec_d;

reg paused = 0;

assign minute = min;
assign second = sec;

reg [1:0] blink;
reg [1:0] blink_d;

assign en = blink;

wire cntClk;
assign cntClk = (state == SET) ? adjClk : counterClk;

always@ (posedge pause) begin
    paused = ~paused;
end

always@(posedge clk) begin
    state <= state_d;
    blink <= blink_d;
end

always@ (posedge cntClk, posedge reset) begin
    if(reset) begin
        sec <= 6'b000000;
        min <= 6'b000000;
    end else begin
        sec <= sec_d;
        min <= min_d;
    end
end

always@ (*) begin
    case(state)
        RUN: begin
            blink_d = 2'b00;
            if(paused) begin
                sec_d = sec;
                min_d = min;
            end else begin
                if(sec == 59) begin
                    if(min == 59) begin
                        sec_d = MAX - 1'b1;
                        min_d = MAX - 1'b1;
                    end else begin
                        sec_d = 0;
                        min_d = min + 1;
                    end
                end else begin
                    sec_d = sec + 1;
                    min_d = min;
                end
            end
            
            if(adj) begin
                state_d = SET;
            end else begin
                state_d = RUN;
            end
        end
        
        SET: begin
            if(sel) begin
                blink_d = 2'b01;
            end else begin
                blink_d = 2'b10;
            end
            
            if(paused) begin
                sec_d = sec;
                min_d = min;
            end else begin
                if(~sel) begin
                    if(min == 59) begin
                        min_d = 0;
                    end else begin
                        min_d = min + 1;
                    end
                    sec_d = sec;
                end else begin
                    if(sec == 59) begin
                        sec_d = 0;
                    end else begin
                        sec_d = sec + 1;
                    end
                    min_d = min;
                end
            end
            
            if(~adj) begin
                state_d = RUN;
            end else begin
                state_d = SET;
            end
        end
        default: begin
            state_d = RUN;
            sec_d = sec;
            min_d = min;
            blink_d = 2'b00;
        end
    endcase
end

endmodule