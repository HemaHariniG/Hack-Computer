`default_nettype none
module mux4way16(
    input  wire [15:0] a,
    input  wire [15:0] b,
    input  wire [15:0] c,
    input  wire [15:0] d,
    input  wire [1:0]  sel,
    output wire [15:0] y
);
    wire [15:0] out1, out2;

    mux16 m1 (
        .a(a),
        .b(b),
        .sel(sel[0]),
        .y(out1)
    );

    mux16 m2 (
        .a(c),
        .b(d),
        .sel(sel[0]),
        .y(out2)
    );

    mux16 m3 (
        .a(out1),
        .b(out2),
        .sel(sel[1]),
        .y(y)
    );
endmodule
