module alu(x, y, zx, nx, zy, ny, f, no, out, zr, ng);
    input [15:0] x, y;          // Two 16-bit inputs
    input zx, nx, zy, ny, f, no; // 6 control bits
    output [15:0] out;          // 16-bit output
    output zr, ng;              // Status flags: zero, negative
    
    // Internal wires - declare all wires first
    wire [15:0] x_neg, y_neg;
    wire [15:0] x_stage1, y_stage1;  // After zero x,y
    wire [15:0] x_stage2, y_stage2;  // After negate x,y  
    wire [15:0] and_result, add_result; // Function results
    wire [15:0] func_result;         // After function selection
    wire [15:0] func_neg;            // Negated function result
    wire [15:0] final_result;        // After output negation
    wire or_low_out, or_high_out, any_bit_set;
    
    // Stage 1: Zero the inputs if zx/zy are set
    mux16_gate mux_zx(x, 16'h0000, zx, x_stage1);
    mux16_gate mux_zy(y, 16'h0000, zy, y_stage1);
    
    // Stage 2: Negate the inputs if nx/ny are set
    not16_gate not_x(x_stage1, x_neg);
    not16_gate not_y(y_stage1, y_neg);
    mux16_gate mux_nx(x_stage1, x_neg, nx, x_stage2);
    mux16_gate mux_ny(y_stage1, y_neg, ny, y_stage2);
    
    // Stage 3: Compute both AND and ADD functions
    and16_gate and_func(x_stage2, y_stage2, and_result);
    add16 add_func(x_stage2, y_stage2, add_result);
    
    // Stage 4: Select function based on f control bit
    // f=0: AND function, f=1: ADD function
    mux16_gate mux_func(and_result, add_result, f, func_result);
    
    // Stage 5: Negate output if no is set
    not16_gate not_out(func_result, func_neg);
    mux16_gate mux_no(func_result, func_neg, no, final_result);
    
    // Final output
    assign out = final_result;
    
    // Status flags computation
    // zr = 1 if output is zero (all bits are 0)
    or8way_gate or_low(final_result[7:0], or_low_out);
    or8way_gate or_high(final_result[15:8], or_high_out);
    or_gate or_all(or_low_out, or_high_out, any_bit_set);
    not_gate not_zr(any_bit_set, zr);
    
    // ng = 1 if output is negative (MSB = 1 in two's complement)
    assign ng = final_result[15];
endmodule