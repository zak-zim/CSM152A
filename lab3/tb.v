module tb;

    reg clk;
    reg reset = 0;
    reg sel = 0;
    reg adj = 0;
    reg pause = 0;
    
    StopTop UUT(reset, clk, sel, adj, pause);
    integer i = 0;
    
    initial begin
        clk = 0;
        #1000 $stop;
    end
    
    always begin
        #5
        clk = ~clk;
        i = i + 1;
        if(i > 50000) begin
            pause = 1;
        end
        if(i > 100000) begin
            pause = 0;
        end
        if(i > 20000000) begin
            reset = 1;
            pause = 0;
        end;
        if(i > 20001000) begin
            reset = 0;
            adj = 1;
            pause = 1;
        end
        if(i > 20001100) begin
            pause = 0;
        end
    end
    
    
endmodule
    