module mux4way16(a, b, c, d, sel, out);
    input [15:0] a, b, c, d;
    input [1:0] sel;
    output [15:0] out;

    wire [15:0] mux1, mux2;

    mux16 m1(a, b, sel[0], mux1);
    mux16 m2(c, d, sel[0], mux2);
    mux16 m3(mux1, mux2, sel[1], out);
endmodule

module mux16(a, b, sel, out);
    input [15:0] a, b;
    input sel;
    output [15:0] out;

    genvar i;
    generate
        for (i=0; i<16; i=i+1) begin: mux_loop
            mux m(a[i], b[i], sel, out[i]);
        end
    endgenerate
endmodule
