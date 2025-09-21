`timescale 1ns/1ps
module tb_dmux4way;
     reg in;
    reg [1:0] sel;
    wire a, b, c, d;
    
    dmux4way_gate uut(in, sel, a, b, c, d);
    
    initial begin
        $display("Testing DMUX4WAY Gate");
        $display("Time\tin\tsel\ta\tb\tc\td");
        $monitor("%4t\t%b\t%b\t%b\t%b\t%b\t%b", $time, in, sel, a, b, c, d);
        
        in = 0; sel = 2'b00; #10;
        in = 0; sel = 2'b01; #10;
        in = 0; sel = 2'b10; #10;
        in = 0; sel = 2'b11; #10;
        in = 1; sel = 2'b00; #10;
        in = 1; sel = 2'b01; #10;
        in = 1; sel = 2'b10; #10;
        in = 1; sel = 2'b11; #10;
        
        $display("DMUX4WAY Gate Test Complete\n");
        $finish;
    end
endmodule
