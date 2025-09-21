module full_adder(a, b, c, sum, carry);
    input a, b, c;
    output sum, carry;
    
    wire sum1, carry1, carry2;
    
    // First half adder: A + B
    half_adder ha1(a, b, sum1, carry1);
    
    // Second half adder: (A+B) + C
    half_adder ha2(sum1, c, sum, carry2);
    
    // Final carry: C1 OR C2
    or_gate or1(carry1, carry2, carry);
endmodule