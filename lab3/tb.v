module tb;

    reg clk;
    wire outClk1;
    wire outClk2;
    wire outClk3;
    wire outClk4;
            
    
    clock UUT(clk, outClk1, outClk2, outClk3, outClk4);
    integer i;
    
    initial begin
        clk = 0;
        #1000 $stop;
    end
    
    always begin
        #5 clk = ~clk;
    end
    
    
endmodule
    