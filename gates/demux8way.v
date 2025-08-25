`default_nettype none
module dmux8way(
    input  wire in,
    input  wire [2:0] sel,
    output wire a, b, c, d, e, f, g, h
);
    wire upper, lower;

    // First stage: split in into two
    dmux level1 (
        .in(in),
        .sel(sel[2]),
        .a(upper),
        .b(lower)
    );

    // Second stage: each half goes to a dmux4way
    dmux4way upper_dmux (
        .in(upper),
        .sel(sel[1:0]),
        .a(a), .b(b), .c(c), .d(d)
    );

    dmux4way lower_dm_
