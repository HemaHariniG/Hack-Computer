`default_nettype none
module mux8way16(
    input  wire [15:0] a, b, c, d, e, f, g, h,
    input  wire [2:0]  sel,
    output wire [15:0] y
);
    wire [15:0] upper_mux, lower_mux;

    mux4way16 lower (
        .a(a), .b(b), .c(c), .d(d),
        .sel(sel[1:0]),
        .y(lower_mux)
    );

    mux4way16 upper (
        .a(e), .b(f), .c(g), .d(h),
        .sel(sel[1:0]),
        .y(upper_mux)
    );

    mux16 final_mux (
        .a(lower_mux),
        .b(upper_mux),
        .sel(sel[2]),
        .y(y)
    );
endmodule
