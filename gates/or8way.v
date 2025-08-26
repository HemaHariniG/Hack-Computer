//`default_nettype none
module or8way(in, out);
    input [7:0] in;
    output out;

    wire o1, o2, o3, o4, o5, o6, o7;

    or_gate or1(in[0], in[1], o1);
    or_gate or2(o1, in[2], o2);
    or_gate or3(o2, in[3], o3);
    or_gate or4(o3, in[4], o4);
    or_gate or5(o4, in[5], o5);
    or_gate or6(o5, in[6], o6);
    or_gate or7(o6, in[7], out);
endmodule

