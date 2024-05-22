module tb;

reg clk=0;
reg[7:0] switch=0;
reg[3:0] button;
reg minutes = 3;
reg seconds = 2;
reg[3:0] AnodeSelect = 0;
reg[6:0] LED_value = 0;
seven_seg_display UUT(minutes, seconds, clk, Anode_select);
    always begin
        #5 clk = ~clk;
    end
    
    
    
//    reg clk;
//    wire outClk1;
//    wire outClk2;
//    wire outClk3;
//    wire outClk4;
            
    
//    clock UUT(clk, outClk1, outClk2, outClk3, outClk4);
//    integer i;
    
//    initial begin
//        clk = 0;
//        #1000 $stop;
//    end
    
//    always begin
//        #5 clk = ~clk;
//    end
    
    
endmodule
    