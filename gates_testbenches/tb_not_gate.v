`timescale 1ns/1ps
module tb_not_gate;

    reg in;
    wire out;

    not_gate uut(in, out);

    initial begin
        $monitor($time, ": in=%b -> out=%b", in, out);

        in = 0; #10;
        in = 1; #10;

        $finish;
    end

endmodule
