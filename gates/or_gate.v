module or_gate(a, b, out);
    input a, b;
    output out;
    
    wire not_a, not_b;
    not_gate not1(a, not_a);
    not_gate not2(b, not_b);
    nand_gate nand1(not_a, not_b, out);
endmodule

