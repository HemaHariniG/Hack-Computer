`timescale 1ns/1ps
module tb_mux8way16;
    reg [15:0] a, b, c, d, e, f, g, h;
    reg [2:0] sel;
    wire [15:0] out;

    mux8way16 uut(a, b, c, d, e, f, g, h, sel, out);

    initial begin
        $monitor($time, ": sel=%b -> out=%h", sel, out);

        a=16'hAAAA; b=16'hBBBB; c=16'hCCCC; d=16'hDDDD;
        e=16'hEEEE; f=16'hFFFF; g=16'h1234; h=16'h5678;

        sel=3'b000; #10;
        sel=3'b001; #10;
        sel=3'b010; #10;
        sel=3'b011; #10;
        sel=3'b100; #10;
        sel=3'b101; #10;
        sel=3'b110; #10;
        sel=3'b111; #10;

        $finish;
    end
endmodule
