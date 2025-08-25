`timescale 1ns/1ps
module tb_mux16;
    reg [15:0] a, b;
    reg sel;
    wire [15:0] out;

    mux16 uut(a, b, sel, out);

    initial begin
        $monitor($time, ": a=%h b=%h sel=%b -> out=%h", a, b, sel, out);

        a = 16'hAAAA; b = 16'h5555; sel=0; #10;
        a = 16'hAAAA; b = 16'h5555; sel=1; #10;

        $finish;
    end
endmodule
