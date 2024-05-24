module sevsegdisp(clk, min, sec, en1, en2, leds, Anode);

input clk;
input [5:0] min;
input [5:0] sec;
input en1;
input en2;
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
            if(~en2) begin
                digit = min / 4'b1010;
            end else begin
                digit = 4'b1111;
            end
        end
        2'b01: begin
            Anode = 4'b1011;
            if(~en2) begin
                digit = min % 4'b1010;
            end else begin
                digit = 4'b1111;
            end
        end
        2'b10: begin
            Anode = 4'b1101;
            if(~en1) begin
                digit = sec / 4'b1010;
            end else begin
                digit = 4'b1111;
            end
        end
        2'b11: begin
            Anode = 4'b1110;
            if(~en1) begin
                digit = sec % 4'b1010;
            end else begin
                digit = 4'b1111;
            end
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
