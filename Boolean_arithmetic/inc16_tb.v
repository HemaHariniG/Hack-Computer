module inc16_tb;
    reg [15:0] in;
    wire [15:0] out;
    
    inc16 uut(in, out);
    
    initial begin
        $display("Inc16 Test");
        $display("in\t\tout");
        $display("====\t\t====");
        
        in=16'h0000; #10; $display("%h\t\t%h", in, out);
        in=16'h0001; #10; $display("%h\t\t%h", in, out);
        in=16'h0005; #10; $display("%h\t\t%h", in, out);
        in=16'hFFFF; #10; $display("%h\t\t%h", in, out);
        in=16'h1234; #10; $display("%h\t\t%h", in, out);
        
        $finish;
    end
endmodule