module clock (clk, Hz, output_clk);

input clk;
input [9:0] Hz;
output reg output_clk = 0;

reg[26:0] counter = 0;
reg[26:0] counter_d = 0;
//parameter max_counter = 100000000/Hz/2;

reg output_clk_d = 0;

always@ (posedge clk) begin
    counter <= counter_d;
    output_clk <= output_clk_d;
end

always@ (*) begin
    if(counter == 100000000/Hz/2) begin
        output_clk_d <= ~output_clk;
        counter_d <= 1'b0;
    end else begin
        counter_d <= counter+1;
    end
end
endmodule
