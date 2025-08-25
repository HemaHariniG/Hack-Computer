`timescale 1ns/1ps
module tb_dmux8way;
    reg in;
    reg [2:0] sel;
    wire a, b, c, d, e, f, g, h;

    dmux8way uut(in, sel, a, b, c, d, e, f, g, h);

    initial begin
        $monitor($time, ": in=%b sel=%b -> {a,b,c,d,e,f,g,h}=%b%b%b%b%b%b%b%b", 
                  in, sel, a,b,c,d,e,f,g,h);

        in=1; sel=3'b000; #10;
        sel=3'b001; #10;
        sel=3'b010; #10;
        sel=3'b011; #10;
        sel=3'b100; #10;
        sel=3'b101; #10;
        sel=3'b110; #10;
        sel=3'b111; #10;

        in=0; sel=3'b100; #10;

        $finish;
    end
endmodule
