`timescale 1ns/1ps
module tb_and16;
    reg  [15:0] a, b;
    wire [15:0] out;

    and16 uut(a, b, out);

    initial begin
        $monitor($time, " a=%h b=%h -> out=%h", a, b, out);

        a=16'h0000; b=16'hFFFF; #10;
        a=16'hAAAA; b=16'h5555; #10;
        a=16'hF0F0; b=16'h0FF0; #10;
        a=16'hFFFF; b=16'hFFFF; #10;

        $finish;
    end
endmodule
