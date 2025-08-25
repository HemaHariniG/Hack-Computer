`timescale 1ns/1ps
module tb_or8way;
    reg [7:0] in;
    wire out;

    or8way uut(in, out);

    initial begin
        $monitor($time, ": in=%b -> out=%b", in, out);

        in=8'b00000000; #10;
        in=8'b10000000; #10;
        in=8'b00001000; #10;
        in=8'b11111111; #10;

        $finish;
    end
endmodule
