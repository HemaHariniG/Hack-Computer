module dmux8way_gate(in, sel, a, b, c, d, e, f, g, h);
    input in;
    input [2:0] sel;
    output a, b, c, d, e, f, g, h;
    
    wire dmux1_a, dmux1_b;
    
    dmux_gate dmux1(in, sel[2], dmux1_a, dmux1_b);
    dmux4way_gate dmux2(dmux1_a, sel[1:0], a, b, c, d);
    dmux4way_gate dmux3(dmux1_b, sel[1:0], e, f, g, h);
endmodule
