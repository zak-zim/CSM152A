module tb();

    reg clk;
    reg sel;
    reg conf;
    
    In2Move UUT(clk, sel, conf);
    
    initial begin
        clk = 0;
        sel = 0;
        conf = 0;
        #1000 $stop;
    end
    
    integer i = 0;
    
    always begin
        #5
        clk = ~clk;
        i = i + 1;
        if(i < 10000000) begin
            sel = 0;
            conf = 0;
        end else if (i < 12000000) begin
            sel = 1; // press
            conf = 0;
        end else if (i < 14000000) begin
            sel = 0;
            conf = 0;
        end else if(i < 16000000) begin
            sel = 1; // press
            conf = 0;
        end else if (i < 18000000) begin
            sel = 0;
            conf = 0;
        end else if (i < 20000000) begin
            sel = 1; // press
            conf = 0;
        end else if (i < 22000000) begin
            sel = 0;
            conf = 0;
        end else if (i < 24000000) begin
            sel = 1; //press
            conf = 0;
        end else if (i < 26000000) begin
            sel = 0;
            conf = 0;
        end else if (i < 28000000) begin
            sel = 1;
            conf = 0;
        end else if (i < 30000000) begin
            sel = 0;
            conf = 0;
        end else if (i < 35000000) begin
            sel = 0;
            conf = 1;
        end else if (i < 40000000) begin
            sel = 0;
            conf = 0;
        end
    end

endmodule
