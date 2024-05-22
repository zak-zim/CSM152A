module StopTop(clk, Anode_select, LED_value);

//input reset;
input clk;
//input sel;
//input adj;
//input pause;

    output [3:0] Anode_select;
    output [6:0] LED_value;

wire counterClk;
wire adjClk;
wire dispClk;
wire blinkClk;
//wire [2:0] enables;
//wire [5:0] min;
//wire [5:0] sec;

clock clock(clk, counterClk, adjClk, dispClk, blinkClk);
seven_seg_display ssd(1,1,dispClk,Anode_select,LED_value);

//StopController controller(clk, adj, pause, enables);
endmodule
