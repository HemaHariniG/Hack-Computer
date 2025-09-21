module or16_gate(a, b, out);
    input [15:0] a, b;
    output [15:0] out;
    
    or_gate or0(a[0], b[0], out[0]);
    or_gate or1(a[1], b[1], out[1]);
    or_gate or2(a[2], b[2], out[2]);
    or_gate or3(a[3], b[3], out[3]);
    or_gate or4(a[4], b[4], out[4]);
    or_gate or5(a[5], b[5], out[5]);
    or_gate or6(a[6], b[6], out[6]);
    or_gate or7(a[7], b[7], out[7]);
    or_gate or8(a[8], b[8], out[8]);
    or_gate or9(a[9], b[9], out[9]);
    or_gate or10(a[10], b[10], out[10]);
    or_gate or11(a[11], b[11], out[11]);
    or_gate or12(a[12], b[12], out[12]);
    or_gate or13(a[13], b[13], out[13]);
    or_gate or14(a[14], b[14], out[14]);
    or_gate or15(a[15], b[15], out[15]);
endmodule

