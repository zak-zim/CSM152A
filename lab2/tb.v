`timescale 1ns / 1ns

module tb;

    reg [11:0] dec;
    wire sign;
    wire [2:0] exp;
    wire [3:0] mant;
   
    FPCVT UUT(dec, sign, exp, mant);
   
    initial begin
        #10;
        dec = 12'b000110010010;
        #10;
        $display("%012b to S = %01b, E = %03b, M = %04b" , dec, sign, exp, mant);
        #10;
        dec = 12'b000000000000;
        #10;
        $display("%012b to S = %01b, E = %03b, M = %04b" , dec, sign, exp, mant);
        #10;
        dec = 12'b111111111111;
        #10;
        $display("%012b to S = %01b, E = %03b, M = %04b" , dec, sign, exp, mant);
        #10;
        dec = 12'b011111111111;
        #10;
        $display("%012b to S = %01b, E = %03b, M = %04b" , dec, sign, exp, mant);
        #10;
        dec = 12'b100000000000;
        #10;
        $display("%012b to S = %01b, E = %03b, M = %04b" , dec, sign, exp, mant);
        #10;
        dec = 12'b000110110000;
        #10;
        $display("%012b to S = %01b, E = %03b, M = %04b" , dec, sign, exp, mant);
        #10;
        dec = 12'b100110110000;
        #10;
        $display("%012b to S = %01b, E = %03b, M = %04b" , dec, sign, exp, mant);
        #10;
        dec = 12'b101010100101;
        #10;                                        
        $display("%012b to S = %01b, E = %03b, M = %04b" , dec, sign, exp, mant);
    end

endmodule
