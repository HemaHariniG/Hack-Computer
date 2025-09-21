`timescale 1ns/1ps
module tb_and16;
    reg [15:0] a, b;
    wire [15:0] out;
    
    and16_gate uut(a, b, out);
    
    initial begin
        $display("Testing AND16 Gate");
        $display("Time\ta\t\tb\t\tout");
        $monitor("%4t\t%h\t%h\t%h", $time, a, b, out);
        
        a = 16'h0000; b = 16'h0000; #10;
        a = 16'h0000; b = 16'hFFFF; #10;
        a = 16'hFFFF; b = 16'h0000; #10;
        a = 16'hFFFF; b = 16'hFFFF; #10;
        a = 16'hAAAA; b = 16'h5555; #10;
        a = 16'h1234; b = 16'hABCD; #10;
        
        $display("AND16 Gate Test Complete\n");
        $finish;
    end
endmodule