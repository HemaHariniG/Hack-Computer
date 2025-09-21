`timescale 1ns/1ps
module tb_not_gate;

    reg in;
    wire out;
    
    not_gate uut(in, out);
    
    initial begin
        $display("Testing NOT Gate");
        $display("Time\tin\tout");
        $monitor("%4t\t%b\t%b", $time, in, out);
        
        in = 0; #10;
        in = 1; #10;
        
        $display("NOT Gate Test Complete\n");
        $finish;
    end
endmodule
