`timescale 1ns/1ps
module tb_or8way;

    reg  [7:0] a;
    wire       y;

    or8way uut (
        .a(a),
        .y(y)
    );

    initial begin
        $monitor($time, ": a = %b | y = %b", a, y);

        a = 8'b00000000; #100; // expect 0
        a = 8'b00000001; #100; // expect 1
        a = 8'b10000000; #100; // expect 1
        a = 8'b01010101; #100; // expect 1
        a = 8'b11111111; #100; // expect 1

        $finish;
    end

endmodule
