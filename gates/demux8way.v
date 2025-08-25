module dmux8way(in, sel, a, b, c, d, e, f, g, h);
    input in;
    input [2:0] sel;
    output a, b, c, d, e, f, g, h;

    wire w1, w2;

    dmux d1(in, sel[2], w1, w2);
    dmux4way d2(w1, sel[1:0], a, b, c, d);
    dmux4way d3(w2, sel[1:0], e, f, g, h);
endmodule
