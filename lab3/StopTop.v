module StopTop(clk, Anode_select, LED_value);

//input reset;
input clk;
//input sel;
//input adj;
//input pause;

    output [3:0] Anode_select;
    output [6:0] LED_value;

wire [5:0] min;
wire [5:0] sec;
wire blink;

clock clock(clk, counterClk, adjClk, dispClk, blinkClk);
StopController controller(clk, counterClk, adjClk, adj, pause, sel, reset, min, sec, blink);

endmodule
