module add16_tb;
    reg [15:0] a, b;
    wire [15:0] out;
    
    add16 uut(a, b, out);
    
    initial begin
        $display("Add16 Test");
        $display("a\t\tb\t\tout");
        $display("====\t\t====\t\t====");
        
        a=16'h0000; b=16'h0000; #10; $display("%h\t\t%h\t\t%h", a, b, out);
        a=16'h0000; b=16'h0001; #10; $display("%h\t\t%h\t\t%h", a, b, out);
        a=16'h0001; b=16'h0001; #10; $display("%h\t\t%h\t\t%h", a, b, out);
        a=16'h0005; b=16'h0003; #10; $display("%h\t\t%h\t\t%h", a, b, out);
        a=16'hFFFF; b=16'h0001; #10; $display("%h\t\t%h\t\t%h", a, b, out);
        a=16'h1234; b=16'h5678; #10; $display("%h\t\t%h\t\t%h", a, b, out);
        
        $finish;
    end
endmodule
