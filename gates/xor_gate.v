module xor_gate(a, b, out);
    input a, b;
    output out;

    wire nota, notb, w1, w2;

    not_gate not1(a, nota);
    not_gate not2(b, notb);

    and_gate and1(a, notb, w1);
    and_gate and2(nota, b, w2);

    or_gate or1(w1, w2, out);
endmodule
