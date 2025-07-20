`timescale 1ns/1ps
module tb_mux8way16;

    reg  [15:0] a, b, c, d, e, f, g, h;
    reg  [2:0]  sel;
    wire [15:0] y;

    mux8way16 uut (
        .a(a), .b(b), .c(c), .d(d),
        .e(e), .f(f), .g(g), .h(h),
        .sel(sel),
        .y(y)
    );

    initial begin
        $monitor($time, ": sel = %b | y = %b", sel, y);

        a = 16'b0000000000000001;
        b = 16'b0000000000000010;
        c = 16'b0000000000000100;
        d = 16'b0000000000001000;
        e = 16'b0000000000010000;
        f = 16'b0000000000100000;
        g = 16'b0000000001000000;
        h = 16'b0000000010000000;

        sel = 3'b000; #100;
        sel = 3'b001; #100;
        sel = 3'b010; #100;
        sel = 3'b011; #100;
        sel = 3'b100; #100;
        sel = 3'b101; #100;
        sel = 3'b110; #100;
        sel = 3'b111; #100;

        $finish;
    end

endmodule
