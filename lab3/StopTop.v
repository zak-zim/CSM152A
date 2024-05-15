module StopTop(clk);

input clk;

reg counterClk;
reg adjClk;
reg dispClk;
reg blinkClk;

clock clock(clk, counterClk, adjClk, dispClk, blinkClk);


endmodule
