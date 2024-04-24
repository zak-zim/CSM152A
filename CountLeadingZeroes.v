module CountLeadingZeroes(dec, exp, mant, xBit);

    input [10:0] dec;
    output reg [2:0] exp;
    output reg [3:0] mant;
    output reg xBit;
    
    reg [3:0] num_zeroes;
    reg [10:0] temp;
    
    always @(*) begin
        num_zeroes = (dec[10]) ? 4'b0001 :  (dec[9]) ? 4'b0010 :  (dec[8]) ? 4'b0011 :  (dec[7]) ? 4'b0100 :  (dec[6]) ? 4'b0101 :  (dec[5]) ? 4'b0110 :  (dec[4]) ? 4'b0111 : 4'b1000;
        temp = (dec << num_zeroes - 1);  //(dec << num_zeroes);
        mant = temp[10:7];
        xBit = temp[6];
        exp = 4'b1000 - num_zeroes;
    end

endmodule