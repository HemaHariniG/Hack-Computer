module dmux_gate(in, sel, a, b);
    input in, sel;
    output a, b;
    
    wire not_sel;
    not_gate not1(sel, not_sel);
    and_gate and1(in, not_sel, a);
    and_gate and2(in, sel, b);
endmodule
