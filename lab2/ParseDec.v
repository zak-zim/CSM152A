module ParseDec(dec, out, sign);

input [11:0] dec;
output [10:0] out;
output sign;

assign sign = dec[11];
assign out = sign ? ~dec[10:0] + 1 : dec[10:0]; // IT will overflow ¯\_(?)_/¯

endmodule