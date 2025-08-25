`timescale 1ns/1ps
module tb_dmux;
    reg in, sel;
    wire a, b;

    dmux uut(in, sel, a, b);

    initial begin
        $monitor($time, ": in=%b sel=%b -> a=%b b=%b", in, sel, a, b);

        in=1; sel=0; #10;
        in=1; sel=1; #10;
        in=0; sel=0; #10;
        in=0; sel=1; #10;

        $finish;
    end
endmodule
