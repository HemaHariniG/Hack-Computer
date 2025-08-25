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
