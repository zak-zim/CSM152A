module StopTop(reset, clk, sel, adj, pause);

input reset;
input clk;
input sel;
input adj;
input pause;

wire counterClk;
wire adjClk;
wire dispClk;
wire blinkClk;
wire [5:0] min;
wire [5:0] sec;
wire blink;

clock clock(clk, counterClk, adjClk, dispClk, blinkClk);
StopController controller(clk, counterClk, adjClk, adj, pause, sel, reset, min, sec, blink);

endmodule
