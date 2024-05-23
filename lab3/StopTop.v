module StopTop(reset, clk, sel, adj, pause);

input reset;
input clk;
input sel;
input adj;
input pause;

wire reset_clean;
wire sel_clean;
wire adj_clean;
wire pause_clean;

wire counterClk = 0;
wire adjClk = 0;
wire dispClk = 0;
wire blinkClk = 0;
wire [5:0] min;
wire [5:0] sec;
wire blink = 0;

db debon1(reset, dispClk, reset_clean);
ds debon2(sel, dispClk, sel_clean);
ds debon3(adj, dispClk, adj_clean);
db debon4(pause, dispClk, pause_clean);
clock clock(clk, counterClk, adjClk, dispClk, blinkClk);
StopController controller(clk, counterClk, adjClk, adj_clean, pause_clean, sel_clean, reset_clean, min, sec, blink);

endmodule
