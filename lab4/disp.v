module disp(clk, result, leds, Anode);

input clk;
input [1:0] result;
output reg [6:0] leds;
output reg [3:0] Anode;

reg [1:0] activate = 0;
reg [3:0] digit;
reg [1:0] timer;

initial begin
    activate = 0;
    digit = 4'b0000;
end

always@ (posedge clk) begin
    activate <= activate + 1;
end

always@ (*) begin
    case(activate)
        2'b00: begin
            Anode = 4'b0111;
            digit = 4'b1111;
        end
        2'b01: begin
            Anode = 4'b1011;
            digit = 4'b1111;
        end
        2'b10: begin
            Anode = 4'b1101;
            digit = 4'b1111;
        end
        2'b11: begin
            Anode = 4'b1110;
            digit = 4'b1111;
        end
        default: begin
            Anode = 4'b0111;
            digit = 4'b1111;
        end
     endcase
end

always@ (*) begin
    case(digit)
         4'b0000: leds = 7'b1000000;  
         4'b0001: leds = 7'b1111001; 
         4'b0010: leds = 7'b0100100;
         4'b0011: leds = 7'b0110000;
         4'b0100: leds = 7'b0011001;
         4'b0101: leds = 7'b0010010;
         4'b0110: leds = 7'b0000010;
         4'b0111: leds = 7'b1111000;
         4'b1000: leds = 7'b0000000;
         4'b1001: leds = 7'b0011000;
         4'b1111: leds = 7'b1111111;
         default: leds = 7'b0111111;
     endcase
end

endmodule