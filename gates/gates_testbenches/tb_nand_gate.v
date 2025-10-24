`timescale 1ns/1ps
module tb_nand_gate;

      reg a, b;
    wire out;
    
    nand_gate uut(a, b, out);
    
    initial begin
        $display("Testing NAND Gate");
        $display("Time\ta\tb\tout");
        $monitor("%4t\t%b\t%b\t%b", $time, a, b, out);
        
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        
        $display("NAND Gate Test Complete\n");
        $finish;
    end
endmodule