module demux(in, sel, a, b);
    input in, sel;
    output a, b;

    wire nota;

    not_gate not1(sel, nota);
    and_gate and1(in, nota, a);
    and_gate and2(in, sel, b);
endmodule
