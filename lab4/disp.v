module disp(clk, d1, d2, d3, d4, leds, Anode);

input clk;
input [3:0] d1;
input [3:0] d2;
input [3:0] d3;
input [3:0] d4;
output reg [6:0] leds;
output reg [3:0] Anode;

reg [1:0] activate = 0;
reg [3:0] digit;

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
            digit = d1;
//            if(mode == 2'b10) begin
//                if(in == 2'b11) begin
//                    digit = 4'b1000;
//                end else begin
//                    digit = 4'b1111;
//                end
//            end else if(mode == 2'b11) begin
//                digit = 4'b1111;
//            end else begin
//                digit = 4'b0100;
//            end
        end
        2'b01: begin
            Anode = 4'b1011;
            digit = d2;
//            case(mode)
//                2'b00: begin
//                    digit = 4'b0001;
//                end
//                2'b01: begin
//                    digit = 4'b0010;
//                end
//                2'b10: begin
//                    if(in == 2'b11) begin
//                        digit = 4'b0001;
//                    end else begin
//                        digit = 4'b0100;
//                    end
//                end
//                2'b11: begin
//                    digit = 4'b1111;
//                end
//            endcase
        end
        2'b10: begin
            Anode = 4'b1101;
            digit = d3;
//            if(mode == 2'b10) begin
//                if(in == 2'b11) begin
//                    digit = 4'b0100;
//                end else if(in == 2'b01) begin
//                    digit = 4'b0001;
//                end else begin
//                    digit = 4'b0010;
//                end
//            end else begin
//                digit = 4'b1111;
//            end
        end
        2'b11: begin
            Anode = 4'b1110;
            digit = d4;
//            if(mode == 2'b10) begin
//                if(in == 2'b11) begin
//                    digit = 4'b0010;
//                end else begin
//                    digit = 4'b1111;
//                end
//            end else if(mode == 2'b11) begin
//                digit = 4'b1111;
//            end else begin
//                digit = in;
//            end
        end
        default: begin
            Anode = 4'b0111;
            digit = 4'b1011;
        end
     endcase
end

always@ (*) begin
    case(digit)
         4'b0000: leds = 7'b1000000;  // 0
         4'b0001: leds = 7'b1111001;  // 1
         4'b0010: leds = 7'b0100100;  // 2
         4'b0100: leds = 7'b0001100;  // P
         4'b0101: leds = 7'b0101111;  // R? its small :(
         4'b0110: leds = 7'b0100100;  // S?
         4'b1000: leds = 7'b0111111;  // -
         4'b1111: leds = 7'b1111111;  // off
//         4'b0001: leds = 7'b1111001; 
//         4'b0010: leds = 7'b0100100;
//         4'b0011: leds = 7'b0110000;
//         4'b0100: leds = 7'b0011001;
//         4'b0101: leds = 7'b0010010;
//         4'b0110: leds = 7'b0000010;
//         4'b0111: leds = 7'b1111000;
//         4'b1000: leds = 7'b0000000;
//         4'b1001: leds = 7'b0011000;
//         4'b1111: leds = 7'b1111111;
         default: leds = 7'b0111110;  // just a werid shape
     endcase
end

endmodule
