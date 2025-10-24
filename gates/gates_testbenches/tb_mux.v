`timescale 1ns/1ps
module tb_mux;
  reg a, b, sel;
    wire out;
    
    mux_gate uut(a, b, sel, out);
    
    initial begin
        $display("Testing MUX Gate");
        $display("Time\ta\tb\tsel\tout");
        $monitor("%4t\t%b\t%b\t%b\t%b", $time, a, b, sel, out);
        
        a = 0; b = 0; sel = 0; #10;
        a = 0; b = 0; sel = 1; #10;
        a = 0; b = 1; sel = 0; #10;
        a = 0; b = 1; sel = 1; #10;
        a = 1; b = 0; sel = 0; #10;
        a = 1; b = 0; sel = 1; #10;
        a = 1; b = 1; sel = 0; #10;
        a = 1; b = 1; sel = 1; #10;
        
        $display("MUX Gate Test Complete\n");
        $finish;
    end
endmodule
