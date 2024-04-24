module Rounding(significant, xBit, inExp, exp, mant);
    
    input [3:0] significant;
    input xBit;
    input [2:0] inExp;
    output reg [2:0] exp;
    output reg [3:0] mant;
    reg[4:0] temp;
    reg[3:0] temp2;
    
    always @(*) begin
    temp = significant + xBit;
        mant = temp[4] ? 4'b0001 : temp[3:0];
        temp2 = inExp + temp[4];
        if(temp2[3]) begin
            exp = 3'b111;
            mant = 4'b1111;
        end else begin
            exp = temp2;
        end
    end

endmodule
