module mux8way16_gate(a, b, c, d, e, f, g, h, sel, out);
    input [15:0] a, b, c, d, e, f, g, h;
    input [2:0] sel;
    output [15:0] out;
    
    wire [15:0] mux1_out, mux2_out;
    
    mux4way16_gate mux1(a, b, c, d, sel[1:0], mux1_out);
    mux4way16_gate mux2(e, f, g, h, sel[1:0], mux2_out);
    mux16_gate mux3(mux1_out, mux2_out, sel[2], out);
endmodule