module alu_basic(x, y, zx, nx, zy, ny, f, no, out);
    input [15:0] x, y;          // Two 16-bit inputs
    input zx, nx, zy, ny, f, no; // 6 control bits
    output [15:0] out;          // 16-bit output only
    
    // Internal wires
    wire [15:0] x_neg, y_neg;
    wire [15:0] x_stage1, y_stage1;
    wire [15:0] x_stage2, y_stage2;
    wire [15:0] and_result, add_result;
    wire [15:0] func_result;
    wire [15:0] func_neg;
    
    // Same logic as full ALU but without status flags
    mux16_gate mux_zx(x, 16'h0000, zx, x_stage1);
    mux16_gate mux_zy(y, 16'h0000, zy, y_stage1);
    
    not16_gate not_x(x_stage1, x_neg);
    not16_gate not_y(y_stage1, y_neg);
    mux16_gate mux_nx(x_stage1, x_neg, nx, x_stage2);
    mux16_gate mux_ny(y_stage1, y_neg, ny, y_stage2);
    
    and16_gate and_func(x_stage2, y_stage2, and_result);
    add16 add_func(x_stage2, y_stage2, add_result);
    
    mux16_gate mux_func(and_result, add_result, f, func_result);
    
    not16_gate not_out(func_result, func_neg);
    mux16_gate mux_no(func_result, func_neg, no, out);
endmodule
