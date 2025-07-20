`default_nettype none
module and_gate(
    input wire a,
    input wire b,
    output wire y
);
    wire nand_out;
    nand_gate u1 (.a(a), .b(b), .y(nand_out));
    nand_gate u2 (.a(nand_out), .b(nand_out), .y(y));
endmodule
