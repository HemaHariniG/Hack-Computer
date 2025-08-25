`timescale 1ns/1ps
module tb_dmux4way;
    reg in;
    reg [1:0] sel;
    wire a, b, c, d;

    dmux4way uut(in, sel, a, b, c, d);

    initial begin
        $monitor($time, ": in=%b sel=%b -> a=%b b=%b c=%b d=%b", in, sel, a, b, c, d);

        in=1; sel=2'b00; #10;
        in=1; sel=2'b01; #10;
        in=1; sel=2'b10; #10;
        in=1; sel=2'b11; #10;
        in=0; sel=2'b00; #10;

        $finish;
    end
endmodule
