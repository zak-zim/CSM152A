module StopTop(reset, clk, sel, adj, pause, seg, an);

input reset;
input clk;
input sel;
input adj;
input pause;
output [6:0] seg;
output [3:0] an;

wire reset_clean;
wire sel_clean;
wire adj_clean;
wire pause_clean;

wire counterClk;
wire adjClk;
wire dispClk;
wire blinkClk;
wire [5:0] min;
wire [5:0] sec;
wire blink = 0;

db debon1(reset, dispClk, reset_clean);
ds debon2(sel, dispClk, sel_clean);
ds debon3(adj, dispClk, adj_clean);
db debon4(pause, dispClk, pause_clean);
clock clock(clk, counterClk, adjClk, dispClk, blinkClk);
StopController controller(clk, counterClk, adjClk, adj_clean, pause_clean, sel_clean, reset_clean, min, sec, blink);
sevsegdisp disp(dispClk, 6'b000101, 6'b111001, seg, an);

endmodule
