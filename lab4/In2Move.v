module In2Move(clk, sel, start, confirm, move);

input clk;
input sel;
input start;
input confirm;
output reg [1:0] move;

reg [1:0] opt = 2'b11;
reg [1:0] move_d;

always@ (posedge clk) begin
    move <= move_d;
end

always@ (posedge sel, negedge confirm, posedge start) begin
    if(sel) begin
        if(opt == 2'b10) begin
            opt = 2'b00;
        end else begin
            opt = opt + 1;
        end
    end else if(start) begin
        move_d <= 2'b11;
        opt <= 2'b11;
    end else begin
        move_d <= opt;
    end
end

endmodule
