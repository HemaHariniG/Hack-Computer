`timescale 1ns/1ps
module tb_not16;
    reg [15:0] in;
    wire [15:0] out;
    
    not16_gate uut(in, out);
    
    initial begin
        $display("Testing NOT16 Gate");
        $display("Time\tin\t\t\tout");
        $monitor("%4t\t%b\t%b", $time, in, out);
        
        in = 16'h0000; #10;
        in = 16'hFFFF; #10;
        in = 16'hAAAA; #10;
        in = 16'h5555; #10;
        in = 16'h1234; #10;
        
        $display("NOT16 Gate Test Complete\n");
        $finish;
    end
endmodule