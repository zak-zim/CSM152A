module In2Move(clk, sel, confirm, move);

input clk;
input sel;
input confirm;
output reg [1:0] move;

reg [1:0] opt = 2'b11;
reg [1:0] move_d;

always@ (posedge clk) begin
    move <= move_d;
end

always@ (posedge sel) begin
    if(opt == 2'b10) begin
        opt = 2'b00;
    end else begin
        opt = opt + 1;
    end
end

always@ (negedge confirm) begin
    move_d = opt;
end

endmodule
