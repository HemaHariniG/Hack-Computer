`default_nettype none
module dmux4way(
    input  wire in,
    input  wire [1:0] sel,
    output wire a, b, c, d
);
    wire upper, lower;

    dmux level1 (
        .in(in),
        .sel(sel[1]),
        .a(upper),
        .b(lower)
    );

    dmux level2_upper (
        .in(upper),
        .sel(sel[0]),
        .a(a),
        .b(b)
    );

    dmux level2_lower (
        .in(lower),
        .sel(sel[0]),
        .a(c),
        .b(d)
    );
endmodule
