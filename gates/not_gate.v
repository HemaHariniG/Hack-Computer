`default_nettype none
module not_gate(
    input wire a,
    output wire y
);
    nand_gate u1 (.a(a), .b(a), .y(y));
endmodule
