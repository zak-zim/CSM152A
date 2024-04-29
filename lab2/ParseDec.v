module ParseDec(dec, out, sign);

    input [11:0] dec;
    output reg [10:0] out;
    output reg sign;

    always @(*) begin
        sign = dec[11];
        out = sign ? ~dec[11:0] + 1 : dec[10:0];  
        if(dec == 12'b100000000000) begin
            out = 11'b11111111111;
        end
    end

endmodule