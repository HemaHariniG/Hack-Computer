module or8way_gate(in, out);
    input [7:0] in;
    output out;
    
    wire or1_out, or2_out, or3_out, or4_out, or5_out, or6_out;
    
    or_gate or1(in[0], in[1], or1_out);
    or_gate or2(in[2], in[3], or2_out);
    or_gate or3(in[4], in[5], or3_out);
    or_gate or4(in[6], in[7], or4_out);
    or_gate or5(or1_out, or2_out, or5_out);
    or_gate or6(or3_out, or4_out, or6_out);
    or_gate or7(or5_out, or6_out, out);
endmodule

