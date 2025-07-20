`default_nettype none
module mux_gate(
    input wire a,
    input wire b,
    input wire sel,
    output wire y
);
    wire nota, notsel, a_and_notsel, b_and_sel;

    not_gate u1 (.a(sel), .y(notsel));
    and_gate u2 (.a(a), .b(notsel), .y(a_and_notsel));
    and_gate u3 (.a(b), .b(sel), .y(b_and_sel));
    or_gate  u4 (.a(a_and_notsel), .b(b_and_sel), .y(y));
endmodule
