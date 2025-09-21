module mux_gate(a, b, sel, out);
    input a, b, sel;
    output out;
    
    wire not_sel, and1_out, and2_out;
    not_gate not1(sel, not_sel);
    and_gate and1(a, not_sel, and1_out);
    and_gate and2(b, sel, and2_out);
    or_gate or1(and1_out, and2_out, out);
endmodule

