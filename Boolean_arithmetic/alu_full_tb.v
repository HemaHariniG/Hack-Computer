module alu_full_tb;
    reg [15:0] x, y;
    reg zx, nx, zy, ny, f, no;
    wire [15:0] out;
    wire zr, ng;
    
    alu uut(x, y, zx, nx, zy, ny, f, no, out, zr, ng);
    
    initial begin
        $display("ALU Full Test (Stage 2 - with status flags)");
        $display("Time\tx\ty\tzx nx zy ny f no\tout\tzr ng\tFunction");
        $display("====\t====\t====\t== == == == = ==\t====\t== ==\t========");
        
        // Test with various inputs to verify status flags
        x = 16'h0000; y = 16'h0000;
        
        // Test zero flag
        {zx,nx,zy,ny,f,no} = 6'b101010; #10; // Should output 0
        $display("%4t\t%h\t%h\t%b  %b  %b  %b  %b  %b\t%h\t%b  %b\t0 (zr should be 1)", 
                 $time, x, y, zx, nx, zy, ny, f, no, out, zr, ng);
        
        // Test with non-zero values
        x = 16'h000F; y = 16'h0003;
        
        {zx,nx,zy,ny,f,no} = 6'b000010; #10; // x+y = positive
        $display("%4t\t%h\t%h\t%b  %b  %b  %b  %b  %b\t%h\t%b  %b\tx+y (positive)", 
                 $time, x, y, zx, nx, zy, ny, f, no, out, zr, ng);
        
        // Test negative flag
        x = 16'h0003; y = 16'h000F;
        {zx,nx,zy,ny,f,no} = 6'b010011; #10; // x-y = negative
        $display("%4t\t%h\t%h\t%b  %b  %b  %b  %b  %b\t%h\t%b  %b\tx-y (ng should be 1)", 
                 $time, x, y, zx, nx, zy, ny, f, no, out, zr, ng);
        
        // Test -1 (negative and non-zero)
        {zx,nx,zy,ny,f,no} = 6'b111010; #10; // -1
        $display("%4t\t%h\t%h\t%b  %b  %b  %b  %b  %b\t%h\t%b  %b\t-1 (ng=1, zr=0)", 
                 $time, x, y, zx, nx, zy, ny, f, no, out, zr, ng);
        
        $display("ALU Full Test Complete!");
        $finish;
    end
endmodule