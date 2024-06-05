module top(clk, cpu_mode, sel1, conf1, sel2, conf2, start, seg, an);

input clk;
input cpu_mode;
input sel1;
input conf1;
input sel2;
input conf2;
input start;
output [6:0] seg;
output [3:0] an;

wire [1:0] move1;
wire [1:0] move2;
wire [1:0] cpu_move;
wire [1:0] player_move2;
wire [1:0] result;

wire dv_clk;

wire sel1_clean;
wire conf1_clean;
wire sel2_clean;
wire conf2_clean;
wire start_clean;

wire ready;
wire [3:0] d1;
wire [3:0] d2;
wire [3:0] d3;
wire [3:0] d4;

clock clkDv(clk, 400, dv_clk);

db sel1db(sel1, dv_clk, sel1_clean);
db conf1db(conf1, dv_clk, conf1_clean);
db sel2db(sel2, dv_clk, sel2_clean);
db conf2db(conf2, dv_clk, conf2_clean);
db startdb(start, dv_clk, start_clean);

In2Move p1(clk, sel1_clean, start_clean, conf1_clean, move1);
In2Move p2(clk, sel2_clean, start_clean, conf2_clean, player_move2);
CPUPlayer cpu(clk, conf1_clean, cpu_move);

assign move2 = cpu_mode ? cpu_move : player_move2;

RPS game(clk, move1, move2, start_clean, result, ready);

suspense sus(clk, dv_clk, ready, move1, move2, result, d1, d2, d3, d4);

disp display(dv_clk, d1, d2, d3, d4, seg, an);

endmodule
