module mux8way16(a, b, c, d, e, f, g, h, sel, out);
    input [15:0] a, b, c, d, e, f, g, h;
    input [2:0] sel;
    output [15:0] out;

    wire [15:0] m1, m2;

    mux4way16 m4a(a, b, c, d, sel[1:0], m1);
    mux4way16 m4b(e, f, g, h, sel[1:0], m2);
    mux16     m8(m1, m2, sel[2], out);
endmodule
