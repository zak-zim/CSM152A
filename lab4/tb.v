module tb();

    reg clk;
    reg mode;
    reg sel1;
    reg conf1;
    reg sel2;
    reg conf2;
    reg start;
    
    top UUT(clk, mode, sel1, conf1, sel2, conf2, start);
//    CPUPlayer UUT(clk, en, out);
    
    initial begin
        clk = 0;
        mode = 0;
        sel1 = 0;
        conf1 = 0;
        sel2 = 0;
        conf2 = 0;
        start = 0;
        #1000 $stop;
    end
    
    integer i = 0;
    integer x = 0;
    
    always begin
        #5
        clk = ~clk;
        i = i + 1;
        x = x + 1;
//        if(i == 5000000) begin
//            conf1 = ~conf1;
//            i = 0;
//        end
//        if(x == 170000) begin
//            sel1 = ~sel1;
//            x = 0;
//        end
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
        end else if (i < 45000000) begin
            start = 1;
        end else if (i < 50000000) begin
            start = 0;
        end else if (i < 55000000) begin
            sel1 = 1;
            sel2 = 1;
        end else if (i < 57500000) begin
            sel1 = 0;
            sel2 = 0;
        end else if (i < 60000000) begin
            sel2 = 1;
        end else if (i < 62500000) begin
            sel2 = 0;
            conf2 = 1;
        end else if (i < 65000000) begin
            conf1 = 1;
        end else if (i < 67500000) begin
            conf1 = 0;
        end else if (i < 70000000) begin
            conf2 = 0;
        end else begin
            sel1 = 0;
            conf1 = 0;
            sel2 = 0;
            conf2 = 0;
            start = 0;
        end
    end

endmodule
