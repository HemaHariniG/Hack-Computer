module and16(a, b, out);
    input  [15:0] a, b;
    output [15:0] out;

    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin: loop
            and_gate u(a[i], b[i], out[i]);  // built from NAND
        end
    endgenerate
endmodule
