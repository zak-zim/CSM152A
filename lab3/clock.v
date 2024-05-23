module clock(clk, countClk, adjClk, dispClk, blinkClk);
    input clk;
    output reg countClk = 0;
    output reg adjClk = 0;
    output reg dispClk = 0;
    output reg blinkClk = 0;
    
    reg[26:0] counter = 0;
    reg[26:0] counter_d = 0;
    reg[26:0] counter1 = 0;
    reg[26:0] counter1_d = 0;
    reg[26:0] counter2 = 0;
    reg[26:0] counter2_d = 0;
    reg[26:0] counter3 = 0;
    reg[26:0] counter3_d = 0;
    
    reg countClk_d = 0;
    reg adjClk_d = 0;
    reg dispClk_d = 0;
    reg blinkClk_d = 0;

    
    always@ (posedge clk) begin
        counter <= counter_d;
        counter2 <= counter2_d;
        counter3 <= counter3_d;
        counter1 <= counter1_d;
        countClk <= countClk_d;
        adjClk <= adjClk_d;
        dispClk <= dispClk_d;
        blinkClk <= blinkClk_d;
    end
    
    always@ (*) begin
    
//        if(counter2 == 99999) begin
//            counter2_d = 0;
//            dispClk_d = ~dispClk;
//        end else begin
//            counter2_d = counter2 + 1;
//        end
    
        if(counter1 < (100000000 / 2) / 2) begin
            adjClk_d = 1;
        end else begin
            adjClk_d = 0;
        end
        
        if(counter2 < (100000000 / 400) / 2) begin
                dispClk_d = 1;
        end else begin
                dispClk_d = 0;
        end
        
        if(counter3 < (100000000 / 4) / 2) begin
                blinkClk_d = 1;
        end else begin
                blinkClk_d = 0;
        end
    
        if(counter1 == (100000000 / 2) - 1) begin
            counter1_d = 0;
        end else begin
            counter1_d = counter1 + 1;
        end
        
        if(counter2 == (100000000 / 400) - 1) begin
            counter2_d = 0;
        end else begin
            counter2_d = counter2 + 1;
        end
        
        if(counter3 == (100000000 / 4) - 1) begin
            counter3_d = 0;
        end else begin
            counter3_d = counter3 + 1;
        end
        
        if(counter < (100000000) / 2) begin
            countClk_d = 1;
        end else begin
            countClk_d = 0;
        end
        
        if(counter == (100000000) - 1) begin
            counter_d = 0;
        end else begin
            counter_d = counter + 1;
        end
    end
    
endmodule
