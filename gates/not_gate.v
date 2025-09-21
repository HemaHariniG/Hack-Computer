module not_gate(in, out);
    input in;
    output out;
    
    nand_gate nand1(in, in, out);
endmodule
