`timescale 1ns/1ps
module tb_mux4way16;

    reg  [15:0] a, b, c, d;
    reg  [1:0]  sel;
    wire [15:0] y;

    mux4way16 uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .sel(sel),
        .y(y)
    );

    initial begin
        $monitor($time, ": sel = %b | y = %b", sel, y);

        a = 16'b0000000000000001;
        b = 16'b0000000000000010;
        c = 16'b0000000000000100;
        d = 16'b0000000000001000;

        sel = 2'b00; #100; // expect a
        sel = 2'b01; #100; // expect b
        sel = 2'b10; #100; // expect c
        sel = 2'b11; #100; // expect d

        $finish;
    end

endmodule
