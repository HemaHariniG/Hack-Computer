module and_gate(a, b, out);
    input a, b;
    output out;

    wire nand_out;
    nand_gate nand1(a, b, nand_out);
    not_gate not1(nand_out, out);
endmodule
