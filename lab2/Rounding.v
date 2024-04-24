module Rounding(significant, xBit, inExp, exp, mant);

input [3:0] significant;
input xBit;
input [2:0] inExp;
output [2:0] exp;
output [3:0] mant;

assign mant = significant + xBit; // more overflow


endmodule
