module alu_basic_tb;
    reg [15:0] x, y;
    reg zx, nx, zy, ny, f, no;
    wire [15:0] out;
    
    alu_basic uut(x, y, zx, nx, zy, ny, f, no, out);
    
    initial begin
        $display("ALU Basic Test (Stage 1 - without status flags)");
        $display("Testing all 18 functions...");
        $display("x=%h, y=%h", 16'h000A, 16'h0003);
        
        x = 16'h000A; y = 16'h0003; // Test values: x=10, y=3
        
        // Test all 18 functions
        {zx,nx,zy,ny,f,no} = 6'b101010; #10; // 0
        $display("0: %h (should be 0000)", out);
        
        {zx,nx,zy,ny,f,no} = 6'b111111; #10; // 1  
        $display("1: %h (should be 0001)", out);
        
        {zx,nx,zy,ny,f,no} = 6'b111010; #10; // -1
        $display("-1: %h (should be FFFF)", out);
        
        {zx,nx,zy,ny,f,no} = 6'b001100; #10; // x
        $display("x: %h (should be 000A)", out);
        
        {zx,nx,zy,ny,f,no} = 6'b110000; #10; // y
        $display("y: %h (should be 0003)", out);
        
        {zx,nx,zy,ny,f,no} = 6'b001101; #10; // !x
        $display("!x: %h (should be FFF5)", out);
        
        {zx,nx,zy,ny,f,no} = 6'b110001; #10; // !y
        $display("!y: %h (should be FFFC)", out);
        
        {zx,nx,zy,ny,f,no} = 6'b001111; #10; // -x
        $display("-x: %h (should be FFF6)", out);
        
        {zx,nx,zy,ny,f,no} = 6'b110011; #10; // -y
        $display("-y: %h (should be FFFD)", out);
        
        {zx,nx,zy,ny,f,no} = 6'b011111; #10; // x+1
        $display("x+1: %h (should be 000B)", out);
        
        {zx,nx,zy,ny,f,no} = 6'b110111; #10; // y+1
        $display("y+1: %h (should be 0004)", out);
        
        {zx,nx,zy,ny,f,no} = 6'b001110; #10; // x-1
        $display("x-1: %h (should be 0009)", out);
        
        {zx,nx,zy,ny,f,no} = 6'b110010; #10; // y-1
        $display("y-1: %h (should be 0002)", out);
        
        {zx,nx,zy,ny,f,no} = 6'b000010; #10; // x+y
        $display("x+y: %h (should be 000D)", out);
        
        {zx,nx,zy,ny,f,no} = 6'b010011; #10; // x-y
        $display("x-y: %h (should be 0007)", out);
        
        {zx,nx,zy,ny,f,no} = 6'b000111; #10; // y-x
        $display("y-x: %h (should be FFF9)", out);
        
        {zx,nx,zy,ny,f,no} = 6'b000000; #10; // x&y
        $display("x&y: %h (should be 0002)", out);
        
        {zx,nx,zy,ny,f,no} = 6'b010101; #10; // x|y
        $display("x|y: %h (should be 000B)", out);
        
        $display("ALU Basic Test Complete!");
        $finish;
    end
endmodule
