`timescale 1ns/1ps
module tb_mux16;

    reg  [15:0] a, b;
    reg         sel;
    wire [15:0] y;

    mux16 uut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin
        $monitor($time, ": sel = %b | a = %b | b = %b | y = %b", sel, a, b, y);

        a = 16'b0000000000000000; b = 16'b1111111111111111; sel = 0; #100;
        a = 16'b0000000000000000; b = 16'b1111111111111111; sel = 1; #100;
        a = 16'b1010101010101010; b = 16'b0101010101010101; sel = 0; #100;
        a = 16'b1010101010101010; b = 16'b0101010101010101; sel = 1; #100;

        $finish;
    end

endmodule
