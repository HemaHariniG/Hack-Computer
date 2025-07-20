`default_nettype none
module or16(
    input  wire [15:0] a,
    input  wire [15:0] b,
    output wire [15:0] y
);
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : or_loop
            or_gate u (.a(a[i]), .b(b[i]), .y(y[i]));
        end
    endgenerate
endmodule
