`timescale 1ns/1ps
module tb_or8way;
    reg [7:0] in;
    wire out;
    
    or8way_gate uut(in, out);
    
    initial begin
        $display("Testing OR8WAY Gate");
        $display("Time\tin\t\tout");
        $monitor("%4t\t%b\t%b", $time, in, out);
        
        in = 8'b00000000; #10;
        in = 8'b00000001; #10;
        in = 8'b00001000; #10;
        in = 8'b10000000; #10;
        in = 8'b11111111; #10;
        in = 8'b10101010; #10;
        
        $display("OR8WAY Gate Test Complete\n");
        $finish;
    end
endmodule
