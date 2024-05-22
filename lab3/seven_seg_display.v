module seven_seg_display(minutes, seconds, clk, Anode_select, LED_value);
    input minutes;
    input seconds;
    input clk;
    output reg[3:0] Anode_select;
    output reg[6:0] LED_value;
    integer num;
    reg[1:0] LED_select;
    
    
    always @(posedge clk) begin
        LED_select <= LED_select + 1;
        case(LED_select)
            2'b00: begin
                Anode_select = 4'b1110;
                num = seconds%10;
            end
            2'b01: begin
                Anode_select = 4'b1101;
                num  = seconds/10;
            end
            2'b10: begin
                Anode_select = 4'b1011;
                num = minutes%10;
            end
            2'b11: begin
                Anode_select = 4'b0111;
                num = minutes/10;
            end
        endcase
    end
    
    
    always @(*)
    begin
     case(num)
         0: LED_value = 7'b0000001;  
         1: LED_value = 7'b1001111; 
         2: LED_value = 7'b0010010;
         3: LED_value = 7'b0000110;
         4: LED_value = 7'b1001100;
         5: LED_value = 7'b0100100;
         6: LED_value = 7'b0100000;
         7: LED_value = 7'b0001111;
         8: LED_value = 7'b0000000;
         9: LED_value = 7'b0000100;
         default: LED_value = 7'b0000001;
     endcase
     end
endmodule
