`timescale 1ns/1ps
module tb_comb;

    // inputs
    reg  [15:0] a, b;

    // outputs
    wire [15:0] not_out;
    wire [15:0] and_out;
    wire [15:0] or_out;

    // Instantiate the modules
    not16 u1(a, not_out);
    and16 u2(a, b, and_out);
    or16  u3(a, b, or_out);

    initial begin
        $monitor($time,
                 " a=%h b=%h | NOT(a)=%h AND=%h OR=%h",
                 a, b, not_out, and_out, or_out);

        // Test cases
        a = 16'h0000; b = 16'h0000; #10;
        a = 16'h0000; b = 16'hFFFF; #10;
        a = 16'hAAAA; b = 16'h5555; #10;
        a = 16'hF0F0; b = 16'h0FF0; #10;
        a = 16'h1234; b = 16'h5678; #10;
        a = 16'hFFFF; b = 16'hFFFF; #10;

        $finish;
    end

endmodule
