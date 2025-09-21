module not16_gate(in, out);
    input [15:0] in;
    output [15:0] out;

not_gate not0(in[0], out[0]);
    not_gate not1(in[1], out[1]);
    not_gate not2(in[2], out[2]);
    not_gate not3(in[3], out[3]);
    not_gate not4(in[4], out[4]);
    not_gate not5(in[5], out[5]);
    not_gate not6(in[6], out[6]);
    not_gate not7(in[7], out[7]);
    not_gate not8(in[8], out[8]);
    not_gate not9(in[9], out[9]);
    not_gate not10(in[10], out[10]);
    not_gate not11(in[11], out[11]);
    not_gate not12(in[12], out[12]);
    not_gate not13(in[13], out[13]);
    not_gate not14(in[14], out[14]);
    not_gate not15(in[15], out[15]);
endmodule
