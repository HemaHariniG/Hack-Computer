`timescale 1ns/1ps
module tb_not16;
    reg  [15:0] a;
    wire [15:0] out;

    not16 uut(a, out);

    initial begin
        $monitor($time, " a=%b -> out=%b", a, out);

        a = 16'h0000; #10;
        a = 16'hFFFF; #10;
        a = 16'hAAAA; #10;
        a = 16'h1234; #10;

        $finish;
    end
endmodule
