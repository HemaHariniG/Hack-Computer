module dmux4way(in, sel, a, b, c, d);
    input in;
    input [1:0] sel;
    output a, b, c, d;

    wire w1, w2;

    dmux d1(in, sel[1], w1, w2);
    dmux d2(w1, sel[0], a, b);
    dmux d3(w2, sel[0], c, d);
endmodule

