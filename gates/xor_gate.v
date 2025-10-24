module xor_gate(a, b, out);
    input a, b;
    output out;
    
    wire not_a, not_b, and1_out, and2_out;
    
    not_gate not1(a, not_a);
    not_gate not2(b, not_b);
    and_gate and1(a, not_b, and1_out);
    and_gate and2(not_a, b, and2_out);
    or_gate or1(and1_out, and2_out, out);
endmodule