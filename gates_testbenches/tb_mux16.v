`timescale 1ns/1ps
module tb_mux16;
   reg [15:0] a, b;
    reg sel;
    wire [15:0] out;
    
    mux16_gate uut(a, b, sel, out);
    
    initial begin
        $display("Testing MUX16 Gate");
       $display("Time\ta\tb\tsel\tout");
       $monitor("%4t\t%h\t%h\t%b\t%h",$time,a,b,sel,out);
        
        a = 16'h1234; b = 16'hABCD; sel = 0; #10;
        a = 16'h1234; b = 16'hABCD; sel = 1; #10;
        a = 16'h0000; b = 16'hFFFF; sel = 0; #10;
        a = 16'h0000; b = 16'hFFFF; sel = 1; #10;
        a = 16'hAAAA; b = 16'h5555; sel = 0; #10;
        a = 16'hAAAA; b = 16'h5555; sel = 1; #10;
        
        $display("MUX16 Gate Test Complete\n");
        $finish;
    end
endmodule