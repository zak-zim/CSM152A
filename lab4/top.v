module top(clk, sel1, conf1, sel2, conf2, start);

input clk;
input sel1;
input conf1;
input sel2;
input conf2;
input start;

wire [1:0] move1;
wire [1:0] move2;
wire [1:0] result;

In2Move p1(clk, sel1, start, conf1, move1);
In2Move p2(clk, sel2, start, conf2, move2);

RPS game(clk, move1, move2, start, result);

endmodule
