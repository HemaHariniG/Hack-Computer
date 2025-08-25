`timescale 1ns/1ps
module tb_nand_gate;

    reg a, b;
    wire out;

    nand_gate dut(a, b, out);

    initial begin
        $monitor($time, ": a=%b b=%b -> out=%b", a, b, out);

        a=0; b=0; #10;
        a=0; b=1; #10;
        a=1; b=0; #10;
        a=1; b=1; #10;

        $finish;
    end

endmodule
