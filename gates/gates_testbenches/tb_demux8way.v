`timescale 1ns/1ps
module tb_dmux8way;
    reg in;
    reg [2:0] sel;
    wire a, b, c, d, e, f, g, h;
    
    dmux8way_gate uut(in, sel, a, b, c, d, e, f, g, h);
    
    initial begin
        $display("Testing DMUX8WAY Gate");
        $display("Time\tin\tsel\ta\tb\tc\td\te\tf\tg\th");
        $monitor("%4t\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, in, sel, a, b, c, d, e, f, g, h);
        
        in = 0; sel = 3'b000; #10;
        in = 0; sel = 3'b001; #10;
        in = 0; sel = 3'b010; #10;
        in = 0; sel = 3'b011; #10;
        in = 0; sel = 3'b100; #10;
        in = 0; sel = 3'b101; #10;
        in = 0; sel = 3'b110; #10;
        in = 0; sel = 3'b111; #10;
        
        in = 1; sel = 3'b000; #10;
        in = 1; sel = 3'b001; #10;
        in = 1; sel = 3'b010; #10;
        in = 1; sel = 3'b011; #10;
        in = 1; sel = 3'b100; #10;
        in = 1; sel = 3'b101; #10;
        in = 1; sel = 3'b110; #10;
        in = 1; sel = 3'b111; #10;
        
        $display("DMUX8WAY Gate Test Complete\n");
        $finish;
    end
endmodule