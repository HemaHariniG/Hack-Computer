module or_gate(a, b, out);
    input a, b;
    output out;

    wire nota, notb;
    not_gate not1(a, nota);
    not_gate not2(b, notb);
    nand_gate nand1(nota, notb, out);
endmodule
