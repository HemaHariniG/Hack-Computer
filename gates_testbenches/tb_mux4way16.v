`timescale 1ns/1ps
module tb_mux4way16;
    reg [15:0] a, b, c, d;
    reg [1:0] sel;
    wire [15:0] out;

    mux4way16 uut(a, b, c, d, sel, out);

    initial begin
        $monitor($time, ": sel=%b -> out=%h", sel, out);

        a=16'h1111; b=16'h2222; c=16'h3333; d=16'h4444;

        sel=2'b00; #10;
        sel=2'b01; #10;
        sel=2'b10; #10;
        sel=2'b11; #10;

        $finish;
    end
endmodule
