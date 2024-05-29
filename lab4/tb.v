module tb();
    reg clk;
    wire [6:0] hz = 10;
    
    clock UUT(clk, hz);
    
    integer  i = 0;
    initial begin
        clk = 0;
        #1000 $stop;
    end
        
        always begin
            #5
            clk = ~clk;
            
        end 


endmodule
