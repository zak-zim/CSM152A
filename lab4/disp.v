module disp(clk, p1_choice, p2_choice, leds, Anode);
    
    input clk;
    input p1_choice;
    input p2_choice;
    output reg [6:0] leds;
    output reg [3:0] Anode;
    
    reg [1:0] activate = 0;
    reg [3:0] choice;
    
    initial begin
        activate = 0;
        choice = 4'b0000;
    end
    
    always@ (posedge clk) begin
        activate <= activate + 1;
    end
    
    always@ (*) begin
        case(activate)
            2'b00: begin
                Anode = 4'b0111;
                choice  = p1_choice;
            end
            2'b01: begin
                Anode = 4'b1011;
                choice  = p2_choice;
            end
         endcase
    end
    
    always@ (*) begin
        case(choice)
             //Rock - "r"
             4'b0000: leds = 7'b1000110;
             //Paper - "P"
             4'b0001: leds = 7'b1100111; 
             //Scissors - "S"
             4'b0010: leds = 7'b1011011;
         endcase
    end
    
endmodule


