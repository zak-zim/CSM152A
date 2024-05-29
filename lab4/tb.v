module tb();

    reg clk;
    reg sel1;
    reg conf1;
    reg sel2;
    reg conf2;
    
    top UUT(clk, sel1, conf1, sel2, conf2);
    
    initial begin
        clk = 0;
        sel1 = 0;
        conf1 = 0;
        sel2 = 0;
        conf2 = 0;
        #1000 $stop;
    end
    
    integer i = 0;
    
    always begin
        #5
        clk = ~clk;
        i = i + 1;
        if(i < 10000000) begin
            sel1 = 0;
            conf1 = 0;
        end else if (i < 12000000) begin
            sel1 = 1; // press
            conf1 = 0;
            sel2 = 1;
            conf2 = 0;
        end else if (i < 14000000) begin
            sel1 = 0;
            conf1 = 0;
            sel2 = 0;
            conf2 = 1;
        end else if(i < 16000000) begin
            sel1 = 1; // press
            conf1 = 0;
            sel2 = 0;
            conf2 = 0;
        end else if (i < 18000000) begin
            sel1 = 0;
            conf1 = 0;
        end else if (i < 20000000) begin
            sel1 = 1; // press
            conf1 = 0;
        end else if (i < 22000000) begin
            sel1 = 0;
            conf1 = 0;
        end else if (i < 24000000) begin
            sel1 = 1; //press
            conf1 = 0;
        end else if (i < 26000000) begin
            sel1 = 0;
            conf1 = 0;
        end else if (i < 28000000) begin
            sel1 = 1;
            conf1 = 0;
        end else if (i < 30000000) begin
            sel1 = 0;
            conf1 = 0;
        end else if (i < 35000000) begin
            sel1 = 0;
            conf1 = 1;
        end else if (i < 40000000) begin
            sel1 = 0;
            conf1 = 0;
        end else begin
            sel1 = 0;
            conf1 = 0;
            sel2 = 0;
            conf2 = 0;
        end
    end

endmodule
