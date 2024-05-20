module StopController(clk, counterClk, adjClk, adj, pause, sel, reset, min, sec);

input clk;
input counterClk;
input adjClk;
input adj;
input pause;
input sel;
input reset;
output reg [5:0] min;
output reg [5:0] sec;

reg [1:0] state = 0;
reg [1:0] state_d;

reg [5:0] min_d = 0;
reg [5:0] sec_d = 0;

parameter RUN = 0;
parameter SET = 1;
parameter PAUSE = 2;

always@ (*) begin
    case(state)
        RUN: begin
            if(pause) begin
                state_d = PAUSE;
            end else if (adj) begin
                state_d = SET;
            end else begin
                state_d = RUN;
            end
        end
        SET: begin
            if(pause) begin
                state_d = PAUSE;
            end else if(~adj) begin
                state_d = RUN;
            end else begin
                state_d = SET;
            end
        end
        PAUSE: begin
            if(pause && adj) begin
                state_d = SET;
            end else if(pause && ~adj) begin
                state_d = RUN;
            end else begin
                state_d = PAUSE;
            end
        end
    endcase
end

always@ (posedge clk) begin
    state <= state_d;
end

always@ (posedge counterClk) begin

end

always@ (posedge adjClk) begin

end

endmodule
