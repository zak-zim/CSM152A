`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2024 02:52:23 PM
// Design Name: 
// Module Name: db
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module db(
	input sig_in,
	input slow_clk,
	output btn_valid
    );
wire s1, s2, s3;
DFF mod1(sig_in, s1, slow_clk);
DFF mod2(s1, s2, slow_clk);
DFF mod3(s1, s3, slow_clk);

assign btnvalid = !(s2&s3);

endmodule

module DFF(input p, output reg q, input slow_clk);
initial begin
q = 0;
end
always@ (posedge slow_clk) begin
	q <=p;
end
endmodule