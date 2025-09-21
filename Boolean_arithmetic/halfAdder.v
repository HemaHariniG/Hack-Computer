module half_adder(a, b, sum, carry);
    input a, b;
    output sum, carry;
    
    // Use gates from Project 1
    xor_gate xor1(a, b, sum);
    and_gate and1(a, b, carry);
endmodule