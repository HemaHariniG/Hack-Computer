`default_nettype none
module mux(a, b, sel, out);
    input a, b, sel;
    output out;

    wire nota, w1, w2;

    not_gate not1(sel, nota);
    and_gate and1(a, nota, w1);
    and_gate and2(b, sel, w2);
    or_gate or1(w1, w2, out);
endmodule

