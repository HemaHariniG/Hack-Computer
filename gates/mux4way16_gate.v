module mux4way16_gate(a, b, c, d, sel, out);
    input [15:0] a, b, c, d;
    input [1:0] sel;
    output [15:0] out;
    
    wire [15:0] mux1_out, mux2_out;
    
    mux16_gate mux1(a, b, sel[0], mux1_out);
    mux16_gate mux2(c, d, sel[0], mux2_out);
    mux16_gate mux3(mux1_out, mux2_out, sel[1], out);
endmodule
