`timescale 1ns/1ps
module tb_or16;

    reg  [15:0] a, b;
    wire [15:0] y;

    or16 uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        $monitor($time, ": a = %b | b = %b | y = %b", a, b, y);

        a = 16'b0000000000000000; b = 16'b1111111111111111; #100;
        a = 16'b1010101010101010; b = 16'b0101010101010101; #100;
        a = 16'b0000000000000000; b = 16'b0000000000000000; #100;
        a = 16'b1111111111111111; b = 16'b1111111111111111; #100;

        $finish;
    end

endmodule
