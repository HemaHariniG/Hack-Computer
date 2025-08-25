module not16(a, out);
    input  [15:0] a;
    output [15:0] out;

    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin: loop
            not_gate u(a[i], out[i]);   // built from NAND
        end
    endgenerate
endmodule
