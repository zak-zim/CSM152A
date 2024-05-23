module ds(sig_in, slow_clk, sw_valid);

input sig_in;
input slow_clk;
output reg sw_valid;

wire s1, s2, s3;

DFFs mod1(sig_in, s1, slow_clk);
DFFs mod2(s1, s2, slow_clk);
DFFs mod3(s2, s3, slow_clk);

initial begin
    sw_valid = sig_in;
end

always@ (*) begin
    if(s1 & s2 & !s3) begin
        sw_valid = 1;
    end else if(!s1 & !s2 & s3) begin
        sw_valid = 0;
    end
end
endmodule

module DFFs(input p, output reg q, input slow_clk);
initial begin
q = 0;
end
always@ (posedge slow_clk) begin
	q <= p;
end
endmodule