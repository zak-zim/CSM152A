module CPUPlayer(clk, en, move);

input clk;
input en;
output [1:0] move;

reg [8:0] counter = 0;
reg [8:0] counter_d = 0;
reg [1:0] move_d = 2'b00;

assign move = move_d;

always@ (posedge en) begin
    move_d <= (counter[8:6] ^ counter[5:3] ^ counter[2:0]) % 3;
end

always@ (posedge clk) begin
    counter <= counter_d;
end

always@ (*) begin
    counter_d = counter + 1;
end

endmodule
