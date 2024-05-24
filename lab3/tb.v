module tb;

    reg clk;
    reg reset = 0;
    reg sel = 0;
    reg adj = 0;
    reg pause = 0;
    
    StopTop UUT(reset, clk, sel, adj, pause);
    integer i = 0;
    
    initial begin
        clk = 0;
        #1000 $stop;
    end
    
    always begin
        #5
        clk = ~clk;
        i = i + 1;
        if( i < 10000000) begin
            adj = 0;
        end else begin
            adj = 1;
        end
//        i = i + 1;
//        if ( i < 100000) begin
//            adj = 1;
//        end else if (i < 200000) begin
//            adj = 0;
//        end
//        i = i + 1;
//        if(i > 30010000) begin
//            pause = 1;
//        end else if(i > 19900000) begin
//            pause = 0;
//        end else if(i > 15000000) begin
//            pause = 1;
//        end else if(i > 10000000) begin
//            pause = 0;
//        end else if(i > 7796646) begin
//            pause = 1;
//        end else if(i > 7796640) begin
//            pause = 0;
//        end else if (i > 7796637) begin
//            pause = 1;
//        end else if(i > 7796635) begin
//            pause = 0;
//        end else if(i > 7796632) begin
//            pause = 1;
//        end else if (i > 7796629) begin
//            pause = 0;
//        end
//        if(i > 20001000) begin
//            reset = 0;
//            adj = 0;
//        end else if(i > 20000000) begin
//            reset = 0;
//        end
    end
    
    
endmodule
    