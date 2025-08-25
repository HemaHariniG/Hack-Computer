`timescale 1ns/1ps
module tb_mux;
    reg a, b, sel;
    wire out;

    mux uut(a, b, sel, out);

    initial begin
        $monitor($time, ": a=%b b=%b sel=%b -> out=%b", a, b, sel, out);

        a=0; b=1; sel=0; #10;
        a=0; b=1; sel=1; #10;
        a=1; b=0; sel=0; #10;
        a=1; b=0; sel=1; #10;

        $finish;
    end
endmodule
