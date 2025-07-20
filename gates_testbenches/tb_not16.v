`timescale 1ns/1ps
module tb_not16;

    reg  [15:0] a;
    wire [15:0] y;

    not16 uut (
        .a(a),
        .y(y)
    );

    initial begin
        $monitor($time, ": a = %b | y = %b", a, y);

        a = 16'b0000000000000000; #100;
        a = 16'b1111111111111111; #100;
        a = 16'b1010101010101010; #100;
        a = 16'b0101010101010101; #100;

        $finish;
    end

endmodule
