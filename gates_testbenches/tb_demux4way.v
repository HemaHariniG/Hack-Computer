`timescale 1ns/1ps
module tb_dmux4way;

    reg in;
    reg [1:0] sel;
    wire a, b, c, d;

    dmux4way uut (
        .in(in),
        .sel(sel),
        .a(a), .b(b), .c(c), .d(d)
    );

    initial begin
        $monitor($time, ": in = %b sel = %b | a = %b b = %b c = %b d = %b", in, sel, a, b, c, d);

        in = 1;

        sel = 2'b00; #100;
        sel = 2'b01; #100;
        sel = 2'b10; #100;
        sel = 2'b11; #100;

        in = 0; sel = 2'b00; #100;

        $finish;
    end

endmodule
