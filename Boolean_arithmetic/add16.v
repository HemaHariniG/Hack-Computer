module add16(a, b, out);
    input [15:0] a, b;
    output [15:0] out;
    
    wire [14:0] carry;  // Internal carry signals
    
    // Bit 0: Half adder (no carry in)
    half_adder ha0(a[0], b[0], out[0], carry[0]);
    
    // Bits 1-15: Full adders with carry propagation
    full_adder fa1(a[1], b[1], carry[0], out[1], carry[1]);
    full_adder fa2(a[2], b[2], carry[1], out[2], carry[2]);
    full_adder fa3(a[3], b[3], carry[2], out[3], carry[3]);
    full_adder fa4(a[4], b[4], carry[3], out[4], carry[4]);
    full_adder fa5(a[5], b[5], carry[4], out[5], carry[5]);
    full_adder fa6(a[6], b[6], carry[5], out[6], carry[6]);
    full_adder fa7(a[7], b[7], carry[6], out[7], carry[7]);
    full_adder fa8(a[8], b[8], carry[7], out[8], carry[8]);
    full_adder fa9(a[9], b[9], carry[8], out[9], carry[9]);
    full_adder fa10(a[10], b[10], carry[9], out[10], carry[10]);
    full_adder fa11(a[11], b[11], carry[10], out[11], carry[11]);
    full_adder fa12(a[12], b[12], carry[11], out[12], carry[12]);
    full_adder fa13(a[13], b[13], carry[12], out[13], carry[13]);
    full_adder fa14(a[14], b[14], carry[13], out[14], carry[14]);
    full_adder fa15(a[15], b[15], carry[14], out[15], );  // No carry out needed
endmodule
