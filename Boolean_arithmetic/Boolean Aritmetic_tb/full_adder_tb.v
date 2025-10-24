module full_adder_tb;
    reg a, b, c;
    wire sum, carry;
    
    full_adder uut(a, b, c, sum, carry);
    
    initial begin
        $display("Full Adder Test");
        $display("a b c | sum carry");
        $display("======|==========");
        
        a=0; b=0; c=0; #10; $display("%b %b %b |  %b   %b", a, b, c, sum, carry);
        a=0; b=0; c=1; #10; $display("%b %b %b |  %b   %b", a, b, c, sum, carry);
        a=0; b=1; c=0; #10; $display("%b %b %b |  %b   %b", a, b, c, sum, carry);
        a=0; b=1; c=1; #10; $display("%b %b %b |  %b   %b", a, b, c, sum, carry);
        a=1; b=0; c=0; #10; $display("%b %b %b |  %b   %b", a, b, c, sum, carry);
        a=1; b=0; c=1; #10; $display("%b %b %b |  %b   %b", a, b, c, sum, carry);
        a=1; b=1; c=0; #10; $display("%b %b %b |  %b   %b", a, b, c, sum, carry);
        a=1; b=1; c=1; #10; $display("%b %b %b |  %b   %b", a, b, c, sum, carry);
        
        $finish;
    end
endmodule