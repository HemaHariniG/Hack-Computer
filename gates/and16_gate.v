module and16_gate(a, b, out);
    input [15:0] a, b;
    output [15:0] out;
    
    and_gate and0(a[0], b[0], out[0]);
    and_gate and1(a[1], b[1], out[1]);
    and_gate and2(a[2], b[2], out[2]);
    and_gate and3(a[3], b[3], out[3]);
    and_gate and4(a[4], b[4], out[4]);
    and_gate and5(a[5], b[5], out[5]);
    and_gate and6(a[6], b[6], out[6]);
    and_gate and7(a[7], b[7], out[7]);
    and_gate and8(a[8], b[8], out[8]);
    and_gate and9(a[9], b[9], out[9]);
    and_gate and10(a[10], b[10], out[10]);
    and_gate and11(a[11], b[11], out[11]);
    and_gate and12(a[12], b[12], out[12]);
    and_gate and13(a[13], b[13], out[13]);
    and_gate and14(a[14], b[14], out[14]);
    and_gate and15(a[15], b[15], out[15]);
endmodule
