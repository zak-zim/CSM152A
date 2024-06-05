module In2Move(clk, sel, start, confirm, move_out);

input clk;
input sel;
input start;
input confirm;
output wire [1:0] move_out;

reg [1:0] move = 2'b11;
assign move_out = move;
reg [1:0] move_d = 2'b11;

reg [1:0] opt = 2'b11;

always@ (posedge clk) begin
    move <= move_d;
end

always@ (posedge confirm, posedge start) begin
    if(start) begin
        move_d <= 2'b11;
    end else begin
        move_d <= opt;
    end
end

always@ (posedge sel, posedge start) begin
    if(start) begin
        opt = 2'b11;
    end else begin
        if(opt == 2'b10) begin
            opt = 2'b00;
        end else begin
            opt = opt + 1;
        end
    end
//    if(sel) begin
//        if(opt == 2'b10) begin
//            opt = 2'b00;
//        end else begin
//            opt = opt + 1;
//        end
//    end else if(start) begin
//        move_d = 2'b11;
//        opt = 2'b11;
//    end else begin
//        move_d = opt;
//    end
end

endmodule
