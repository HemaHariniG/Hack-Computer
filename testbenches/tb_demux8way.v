`timescale 1ns/1ps
module tb_dmux8way;

    reg in;
    reg [2:0] sel;
    wire a, b, c, d, e, f, g, h;

    dmux8way uut (
        .in(in),
        .sel(sel),
        .a(a), .b(b), .c(c), .d(d),
        .e(e), .f(f), .g(g), .h(h)
    );

    initial begin
        $monitor($time, ": in = %b sel = %b | a=%b b=%b c=%b d=%b e=%b f=%b g=%b h=%b",
                  in, sel, a,b,c,d,e,f,g,h);

        in = 1;

        sel = 3'b000; #100;
        sel = 3'b001; #100;
        sel = 3'b010; #100;
        sel = 3'b011; #100;
        sel = 3'b100; #100;
        sel = 3'b101; #100;
        sel = 3'b110; #100;
        sel = 3'b111; #100;

        in = 0; sel = 3'b000; #100;

        $finish;
    end

endmodule
