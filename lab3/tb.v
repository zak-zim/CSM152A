module tb;

    reg clk;
    reg reset = 0;
    reg sel = 0;
    reg adj = 0;
    reg pause = 1;
    
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
        if(i > 100000) begin
            adj = 1;
        end;
    end
    
    
endmodule
    