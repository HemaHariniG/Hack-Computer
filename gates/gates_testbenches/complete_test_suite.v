module complete_test_suite;
    
    // Test signals for all gates
    reg a, b, sel, in;
    reg [1:0] sel2;
    reg [2:0] sel3;
    reg [7:0] in8;
    reg [15:0] a16, b16, c16, d16, e16, f16, g16, h16;
    
    // Output wires
    wire nand_out, not_out, and_out, or_out, xor_out, mux_out;
    wire dmux_a, dmux_b;
    wire [15:0] not16_out, and16_out, or16_out, mux16_out;
    wire or8way_out;
    wire [15:0] mux4way16_out, mux8way16_out;
    wire dmux4_a, dmux4_b, dmux4_c, dmux4_d;
    wire dmux8_a, dmux8_b, dmux8_c, dmux8_d, dmux8_e, dmux8_f, dmux8_g, dmux8_h;
    
    // Instantiate all gates
    nand_gate test_nand(a, b, nand_out);
    not_gate test_not(a, not_out);
    and_gate test_and(a, b, and_out);
    or_gate test_or(a, b, or_out);
    xor_gate test_xor(a, b, xor_out);
    mux_gate test_mux(a, b, sel, mux_out);
    dmux_gate test_dmux(in, sel, dmux_a, dmux_b);
    not16_gate test_not16(a16, not16_out);
    and16_gate test_and16(a16, b16, and16_out);
    or16_gate test_or16(a16, b16, or16_out);
    mux16_gate test_mux16(a16, b16, sel, mux16_out);
    or8way_gate test_or8way(in8, or8way_out);
    mux4way16_gate test_mux4way16(a16, b16, c16, d16, sel2, mux4way16_out);
    mux8way16_gate test_mux8way16(a16, b16, c16, d16, e16, f16, g16, h16, sel3, mux8way16_out);
    dmux4way_gate test_dmux4way(in, sel2, dmux4_a, dmux4_b, dmux4_c, dmux4_d);
    dmux8way_gate test_dmux8way(in, sel3, dmux8_a, dmux8_b, dmux8_c, dmux8_d, dmux8_e, dmux8_f, dmux8_g, dmux8_h);
    
    integer test_count, pass_count, fail_count;
    
    // Task to check results
    task check_result;
        input expected;
        input actual;
        input [200*8:1] test_name;
        begin
            test_count = test_count + 1;
            if (expected === actual) begin
                $display("PASS: %s", test_name);
                pass_count = pass_count + 1;
            end else begin
                $display("FAIL: %s - Expected: %b, Got: %b", test_name, expected, actual);
                fail_count = fail_count + 1;
            end
        end
    endtask
    
    // Task to check 16-bit results
    task check_result16;
        input [15:0] expected;
        input [15:0] actual;
        input [200*8:1] test_name;
        begin
            test_count = test_count + 1;
            if (expected === actual) begin
                $display("PASS: %s", test_name);
                pass_count = pass_count + 1;
            end else begin
                $display("FAIL: %s - Expected: %h, Got: %h", test_name, expected, actual);
                fail_count = fail_count + 1;
            end
        end
    endtask
    
    initial begin
        test_count = 0;
        pass_count = 0;
        fail_count = 0;
        
        $display("===============================================");
        $display("Nand2Tetris Project 1 Complete Test Suite");
        $display("===============================================\n");
        
        // Test NAND Gate
        $display("Testing NAND Gate...");
        a = 0; b = 0; #1; check_result(1'b1, nand_out, "NAND(0,0)=1");
        a = 0; b = 1; #1; check_result(1'b1, nand_out, "NAND(0,1)=1");
        a = 1; b = 0; #1; check_result(1'b1, nand_out, "NAND(1,0)=1");
        a = 1; b = 1; #1; check_result(1'b0, nand_out, "NAND(1,1)=0");
        
        // Test NOT Gate
        $display("\nTesting NOT Gate...");
        a = 0; #1; check_result(1'b1, not_out, "NOT(0)=1");
        a = 1; #1; check_result(1'b0, not_out, "NOT(1)=0");
        
        // Test AND Gate
        $display("\nTesting AND Gate...");
        a = 0; b = 0; #1; check_result(1'b0, and_out, "AND(0,0)=0");
        a = 0; b = 1; #1; check_result(1'b0, and_out, "AND(0,1)=0");
        a = 1; b = 0; #1; check_result(1'b0, and_out, "AND(1,0)=0");
        a = 1; b = 1; #1; check_result(1'b1, and_out, "AND(1,1)=1");
        
        // Test OR Gate
        $display("\nTesting OR Gate...");
        a = 0; b = 0; #1; check_result(1'b0, or_out, "OR(0,0)=0");
        a = 0; b = 1; #1; check_result(1'b1, or_out, "OR(0,1)=1");
        a = 1; b = 0; #1; check_result(1'b1, or_out, "OR(1,0)=1");
        a = 1; b = 1; #1; check_result(1'b1, or_out, "OR(1,1)=1");
        
        // Test XOR Gate
        $display("\nTesting XOR Gate...");
        a = 0; b = 0; #1; check_result(1'b0, xor_out, "XOR(0,0)=0");
        a = 0; b = 1; #1; check_result(1'b1, xor_out, "XOR(0,1)=1");
        a = 1; b = 0; #1; check_result(1'b1, xor_out, "XOR(1,0)=1");
        a = 1; b = 1; #1; check_result(1'b0, xor_out, "XOR(1,1)=0");
        
        // Test MUX Gate
        $display("\nTesting MUX Gate...");
        a = 0; b = 0; sel = 0; #1; check_result(1'b0, mux_out, "MUX(0,0,0)=0");
        a = 0; b = 1; sel = 0; #1; check_result(1'b0, mux_out, "MUX(0,1,0)=0");
        a = 1; b = 0; sel = 0; #1; check_result(1'b1, mux_out, "MUX(1,0,0)=1");
        a = 0; b = 0; sel = 1; #1; check_result(1'b0, mux_out, "MUX(0,0,1)=0");
        a = 0; b = 1; sel = 1; #1; check_result(1'b1, mux_out, "MUX(0,1,1)=1");
        a = 1; b = 1; sel = 1; #1; check_result(1'b1, mux_out, "MUX(1,1,1)=1");
        
        // Test DMUX Gate
        $display("\nTesting DMUX Gate...");
        in = 0; sel = 0; #1; 
        if (dmux_a === 1'b0 && dmux_b === 1'b0) begin
            $display("PASS: DMUX(0,0)=(0,0)");
            pass_count = pass_count + 1;
        end else begin
            $display("FAIL: DMUX(0,0) - Expected: (0,0), Got: (%b,%b)", dmux_a, dmux_b);
            fail_count = fail_count + 1;
        end
        test_count = test_count + 1;
        
        in = 1; sel = 0; #1; 
        if (dmux_a === 1'b1 && dmux_b === 1'b0) begin
            $display("PASS: DMUX(1,0)=(1,0)");
            pass_count = pass_count + 1;
        end else begin
            $display("FAIL: DMUX(1,0) - Expected: (1,0), Got: (%b,%b)", dmux_a, dmux_b);
            fail_count = fail_count + 1;
        end
        test_count = test_count + 1;
        
        in = 1; sel = 1; #1; 
        if (dmux_a === 1'b0 && dmux_b === 1'b1) begin
            $display("PASS: DMUX(1,1)=(0,1)");
            pass_count = pass_count + 1;
        end else begin
            $display("FAIL: DMUX(1,1) - Expected: (0,1), Got: (%b,%b)", dmux_a, dmux_b);
            fail_count = fail_count + 1;
        end
        test_count = test_count + 1;
        
        // Test 16-bit Gates
        $display("\nTesting 16-bit Gates...");
        a16 = 16'h0000; #1; check_result16(16'hFFFF, not16_out, "NOT16(0000)=FFFF");
        a16 = 16'hFFFF; #1; check_result16(16'h0000, not16_out, "NOT16(FFFF)=0000");
        a16 = 16'hAAAA; #1; check_result16(16'h5555, not16_out, "NOT16(AAAA)=5555");
        
        a16 = 16'hFFFF; b16 = 16'hFFFF; #1; check_result16(16'hFFFF, and16_out, "AND16(FFFF,FFFF)=FFFF");
        a16 = 16'h0000; b16 = 16'hFFFF; #1; check_result16(16'h0000, and16_out, "AND16(0000,FFFF)=0000");
        a16 = 16'hAAAA; b16 = 16'h5555; #1; check_result16(16'h0000, and16_out, "AND16(AAAA,5555)=0000");
        
        a16 = 16'h0000; b16 = 16'h0000; #1; check_result16(16'h0000, or16_out, "OR16(0000,0000)=0000");
        a16 = 16'h0000; b16 = 16'hFFFF; #1; check_result16(16'hFFFF, or16_out, "OR16(0000,FFFF)=FFFF");
        a16 = 16'hAAAA; b16 = 16'h5555; #1; check_result16(16'hFFFF, or16_out, "OR16(AAAA,5555)=FFFF");
        
        // Test OR8WAY
        $display("\nTesting OR8WAY Gate...");
        in8 = 8'b00000000; #1; check_result(1'b0, or8way_out, "OR8WAY(00000000)=0");
        in8 = 8'b00000001; #1; check_result(1'b1, or8way_out, "OR8WAY(00000001)=1");
        in8 = 8'b10000000; #1; check_result(1'b1, or8way_out, "OR8WAY(10000000)=1");
        in8 = 8'b11111111; #1; check_result(1'b1, or8way_out, "OR8WAY(11111111)=1");
        
        // Test MUX4WAY16
        $display("\nTesting MUX4WAY16 Gate...");
        a16 = 16'h1111; b16 = 16'h2222; c16 = 16'h3333; d16 = 16'h4444;
        sel2 = 2'b00; #1; check_result16(16'h1111, mux4way16_out, "MUX4WAY16 sel=00");
        sel2 = 2'b01; #1; check_result16(16'h2222, mux4way16_out, "MUX4WAY16 sel=01");
        sel2 = 2'b10; #1; check_result16(16'h3333, mux4way16_out, "MUX4WAY16 sel=10");
        sel2 = 2'b11; #1; check_result16(16'h4444, mux4way16_out, "MUX4WAY16 sel=11");
        
        // Test MUX8WAY16
        $display("\nTesting MUX8WAY16 Gate...");
        a16 = 16'h1111; b16 = 16'h2222; c16 = 16'h3333; d16 = 16'h4444;
        e16 = 16'h5555; f16 = 16'h6666; g16 = 16'h7777; h16 = 16'h8888;
        sel3 = 3'b000; #1; check_result16(16'h1111, mux8way16_out, "MUX8WAY16 sel=000");
        sel3 = 3'b001; #1; check_result16(16'h2222, mux8way16_out, "MUX8WAY16 sel=001");
        sel3 = 3'b111; #1; check_result16(16'h8888, mux8way16_out, "MUX8WAY16 sel=111");
        
        // Final Results
        $display("\n===============================================");
        $display("Test Results Summary:");
        $display("Total Tests: %d", test_count);
        $display("Passed: %d", pass_count);
        $display("Failed: %d", fail_count);
        if (fail_count == 0) begin
            $display("🎉 ALL TESTS PASSED! 🎉");
            $display("Project 1 implementation is COMPLETE and CORRECT!");
        end else begin
            $display("❌ Some tests failed. Check your implementations.");
        end
        $display("===============================================\n");
        
        $finish;
    end
    
endmodule