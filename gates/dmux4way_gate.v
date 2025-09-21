module dmux4way_gate(in, sel, a, b, c, d);
    input in;
    input [1:0] sel;
    output a, b, c, d;
    
    wire dmux1_a, dmux1_b;
    
    dmux_gate dmux1(in, sel[1], dmux1_a, dmux1_b);
    dmux_gate dmux2(dmux1_a, sel[0], a, b);
    dmux_gate dmux3(dmux1_b, sel[0], c, d);
endmodule