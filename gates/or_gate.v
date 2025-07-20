`default_nettype none
module or_gate(
    input wire a,
    input wire b,
    output wire y
);
    wire nota, notb, and_out;
    not_gate u1 (.a(a), .y(nota));
    not_gate u2 (.a(b), .y(notb));
    and_gate u3 (.a(nota), .b(notb), .y(and_out));
    not_gate u4 (.a(and_out), .y(y));
endmodule
