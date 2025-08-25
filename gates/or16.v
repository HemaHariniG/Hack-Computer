module or16(a, b, out);
    input  [15:0] a, b;
    output [15:0] out;

    wire [15:0] nota, notb, and_out;

    not16 u1(a, nota);
    not16 u2(b, notb);
    and16 u3(nota, notb, and_out);
    not16 u4(and_out, out);
endmodule
