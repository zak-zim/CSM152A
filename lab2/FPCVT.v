module FPCVT(D, S, E, F);

input [11:0] D;
output S;
output [2:0] E;
output [3:0] F;


    wire [10:0] signless;
    wire [3:0] significant;
    wire [2:0] firstExp;
    wire xBit;

ParseDec pd(D, signless, S);
CountLeadingZeroes clz(signless, firstExp, significant, xBit);
Rounding rounder(significant, xBit, firstExp, E, F);

endmodule