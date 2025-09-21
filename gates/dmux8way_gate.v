module dmux8way_gate(
    input in,
    input [2:0] sel,
    output a,
    output b,
    output c,
    output d,
    output e,
    output f,
    output g,
    output h
);
    wire dmux1_a, dmux1_b;
    
    dmux_gate dmux1(.in(in), .sel(sel[2]), .a(dmux1_a), .b(dmux1_b));
    dmux4way_gate dmux2(.in(dmux1_a), .sel(sel[1:0]), .a(a), .b(b), .c(c), .d(d));
    dmux4way_gate dmux3(.in(dmux1_b), .sel(sel[1:0]), .a(e), .b(f), .c(g), .d(h));
endmodule