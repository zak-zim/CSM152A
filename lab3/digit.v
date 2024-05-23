module digit(numb, sel, leds);

input [3:0] numb;
input sel;
output reg [6:0] leds;

	always@ (*) begin
	
		if (sel) begin
			leds = 7'b1111111;
		end
		else begin
			case (numb)
			
				4'b0000: begin
					leds[0] = 0;
					leds[1] = 0;
					leds[2] = 0;
					leds[3] = 0;
					leds[4] = 0;
					leds[5] = 0;
					leds[6] = 1;
				end
				4'b0001: begin
					leds[0] = 1;
					leds[1] = 0;
					leds[2] = 0;
					leds[3] = 1;
					leds[4] = 1;
					leds[5] = 1;
					leds[6] = 1;
				end
				4'b0010: begin
					leds[0] = 0;
					leds[1] = 0;
					leds[2] = 1;
					leds[3] = 0;
					leds[4] = 0;
					leds[5] = 1;
					leds[6] = 0;
				end
				4'b0011: begin
					leds[0] = 0;
					leds[1] = 0;
					leds[2] = 0;
					leds[3] = 0;
					leds[4] = 1;
					leds[5] = 1;
					leds[6] = 0;
				end
				4'b0100: begin
					leds[0] = 1;
					leds[1] = 0;
					leds[2] = 0;
					leds[3] = 1;
					leds[4] = 1;
					leds[5] = 0;
					leds[6] = 0;
				end
				4'b0101: begin
					leds[0] = 0;
					leds[1] = 1;
					leds[2] = 0;
					leds[3] = 0;
					leds[4] = 1;
					leds[5] = 0;
					leds[6] = 0;
				end
				4'b0110: begin
					leds[0] = 0;
					leds[1] = 1;
					leds[2] = 0;
					leds[3] = 0;
					leds[4] = 0;
					leds[5] = 0;
					leds[6] = 0;
				end
				4'b0111: begin
					leds[0] = 0;
					leds[1] = 0;
					leds[2] = 0;
					leds[3] = 1;
					leds[4] = 1;
					leds[5] = 1;
					leds[6] = 1;
				end
				4'b1000: begin
					leds[0] = 0;
					leds[1] = 0;
					leds[2] = 0;
					leds[3] = 0;
					leds[4] = 0;
					leds[5] = 0;
					leds[6] = 0;
				end
				4'b1001: begin
					leds[0] = 0;
					leds[1] = 0;
					leds[2] = 0;
					leds[3] = 0;
					leds[4] = 1;
					leds[5] = 0;
					leds[6] = 0;
				end
				
				default: begin
					leds[0] = 0;
					leds[1] = 0;
					leds[2] = 0;
					leds[3] = 0;
					leds[4] = 0;
					leds[5] = 0;
					leds[6] = 0;
				end
				
			endcase
		end
		
	end
endmodule