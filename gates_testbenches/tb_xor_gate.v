`timescale 1ns/1ps
module tb_xor_gate;
    reg a, b;
    wire out;
    
    xor_gate uut(a, b, out);
    
    initial begin
        $display("Testing XOR Gate");
        $display("Time\ta\tb\tout");
        $monitor("%4t\t%b\t%b\t%b", $time, a, b, out);
        
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        
        $display("XOR Gate Test Complete\n");
        $finish;
    end
endmodule