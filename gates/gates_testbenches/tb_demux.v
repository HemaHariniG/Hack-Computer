`timescale 1ns/1ps
module tb_dmux;
    reg in, sel;
    wire a, b;
    
    dmux_gate uut(in, sel, a, b);
    
    initial begin
        $display("Testing DMUX Gate");
        $display("Time\tin\tsel\ta\tb");
        $monitor("%4t\t%b\t%b\t%b\t%b", $time, in, sel, a, b);
        
        in = 0; sel = 0; #10;
        in = 0; sel = 1; #10;
        in = 1; sel = 0; #10;
        in = 1; sel = 1; #10;
        
        $display("DMUX Gate Test Complete\n");
        $finish;
    end
endmodule