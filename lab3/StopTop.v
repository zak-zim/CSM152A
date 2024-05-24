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
wire [1:0] blink_en;

db debon1(reset, dispClk, reset_clean);
ds debon2(sel, dispClk, sel_clean);
ds debon3(adj, dispClk, adj_clean);
db debon4(pause, dispClk, pause_clean);
clock clock(clk, counterClk, adjClk, dispClk, blinkClk);
//StopController controller(clk, counterClk, adjClk, adj, pause_clean, sel, reset_clean, min, sec, blink);
StopController cont(clk, counterClk, adjClk, adj, pause_clean, reset_clean, sel, min, sec, blink_en);
sevsegdisp disp(dispClk, min, sec, (blink_en[0] & blinkClk), (blink_en[1] & blinkClk), seg, an);

endmodule
