`default_nettype none
module half_adder(
    input wire a,
    input wire b,
    output wire sum,
    output wire carry
);

    xor_gate u1 (
        .a(a),
        .b(b),
        .out(sum)
    );

    and_gate u2 (
        .a(a),
        .b(b),
        .out(carry)
    );

endmodule
