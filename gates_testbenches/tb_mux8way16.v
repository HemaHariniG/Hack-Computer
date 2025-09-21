`timescale 1ns/1ps
module tb_mux8way16;
  reg [15:0] a, b, c, d, e, f, g, h;
    reg [2:0] sel;
    wire [15:0] out;
    
    mux8way16_gate uut(a, b, c, d, e, f, g, h, sel, out);
    
    initial begin
        $display("Testing MUX8WAY16 Gate");
        $display("Time\tsel\tout");
        $monitor("%4t\t%b\t%h", $time, sel, out);
        
        a = 16'h1111; b = 16'h2222; c = 16'h3333; d = 16'h4444;
        e = 16'h5555; f = 16'h6666; g = 16'h7777; h = 16'h8888;
        
        sel = 3'b000; #10;
        sel = 3'b001; #10;
        sel = 3'b010; #10;
        sel = 3'b011; #10;
        sel = 3'b100; #10;
        sel = 3'b101; #10;
        sel = 3'b110; #10;
        sel = 3'b111; #10;
        
        $display("MUX8WAY16 Gate Test Complete\n");
        $finish;
    end
endmodule