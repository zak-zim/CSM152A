module CountLeadingZeroes(dec, exp, mant, xBit);

input [10:0] dec;
output [2:0] exp;
output [3:0] mant;
output xBit;

wire [3:0] num_zeroes;

assign num_zeroes = (dec[10]) ? 4'b0000 :  (dec[9]) ? 4'b0001 :  (dec[8]) ? 4'b0010 :  (dec[7]) ? 4'b0011 :  (dec[6]) ? 4'b0100 :  (dec[5]) ? 4'b0101 :  (dec[4]) ? 4'b0110 :  (dec[3]) ? 4'b0111 :  4'b1111;  

assign mant = (dec << num_zeroes);
assign xBit = dec << (num_zeroes + 1);
assign exp = 4'b1000 - num_zeroes;

endmodule