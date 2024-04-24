module Dec2FpTop(dec, sign, exp, mant);

input [11:0] dec;
output sign;
output [2:0] exp;
output [3:0] mant;


    wire [10:0] signless;
    wire [3:0] significant;
    wire [2:0] firstExp;
    wire xBit;

ParseDec pd(dec, signless, sign);
CountLeadingZeroes clz(signless, firstExp, significant, xBit);
Rounding rounder(significant, xBit, firstExp, exp, mant);

endmodule