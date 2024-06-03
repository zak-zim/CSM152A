module db(sig_in, slow_clk, btn_valid);

input sig_in;
input slow_clk;
output btn_valid;

wire s1, s2, s3;

DFF mod1(sig_in, s1, slow_clk);
DFF mod2(s1, s2, slow_clk);
DFF mod3(s2, s3, slow_clk);

assign btn_valid = (!s2) & s3;

endmodule

module DFF(input p, output reg q, input slow_clk);
initial begin
q = 0;
end
always@ (posedge slow_clk) begin
	q <= p;
end
endmodule