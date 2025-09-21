module inc16(in, out);
    input [15:0] in;
    output [15:0] out;
    
    // Add input + 1 (represented as 16'b0000000000000001)
    add16 adder(in, 16'b0000000000000001, out);
endmodule