`default_nettype none
module or8way(
    input  wire [7:0] a,
    output wire y
);
    wire o1, o2, o3, o4, o5, o6, o7;

    or_gate u1 (.a(a[0]), .b(a[1]), .y(o1));
    or_gate u2 (.a(a[2]), .b(a[3]), .y(o2));
    or_gate u3 (.a(a[4]), .b(a[5]), .y(o3));
    or_gate u4 (.a(a[6]), .b(a[7]), .y(o4));

    or_gate u5 (.a(o1), .b(o2), .y(o5));
    or_gate u6 (.a(o3), .b(o4), .y(o6));

    or_gate u7 (.a(o5), .b(o6), .y(y));
endmodule
