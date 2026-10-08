`timescale 1ns / 1ps

module low_power_alu_tb;

    // Testbench signals
    reg  [3:0] A;
    reg  [3:0] B;
    reg  [2:0] opcode;
    reg        enable;

    wire [3:0] Y;
    wire       carry;
    wire       zero;

    // Instantiate ALU
    low_power_alu DUT (
        .A(A),
        .B(B),
        .opcode(opcode),
        .enable(enable),
        .Y(Y),
        .carry(carry),
        .zero(zero)
    );

    // Task for displaying test results
    task display_result;
        input [127:0] operation;
        begin
            #5;
            $display("Operation: %s | A = %b | B = %b | Y = %b | Carry = %b | Zero = %b",
                     operation, A, B, Y, carry, zero);
        end
    endtask

    // Test sequence
    initial begin

        $display("==============================================");
        $display("      LOW-POWER 4-BIT ALU TESTBENCH");
        $display("==============================================");

        // Initial values
        A      = 4'b0000;
        B      = 4'b0000;
        opcode = 3'b000;
        enable = 1'b0;

        #10;

        // ----------------------------------------
        // Enable ALU
        // ----------------------------------------
        enable = 1'b1;

        // 000 - ADD
        A      = 4'b0101;
        B      = 4'b0011;
        opcode = 3'b000;
        display_result("ADD");

        // 001 - SUBTRACT
        A      = 4'b1001;
        B      = 4'b0011;
        opcode = 3'b001;
        display_result("SUBTRACT");

        // 010 - AND
        A      = 4'b1100;
        B      = 4'b1010;
        opcode = 3'b010;
        display_result("AND");

        // 011 - OR
        A      = 4'b1100;
        B      = 4'b1010;
        opcode = 3'b011;
        display_result("OR");

        // 100 - XOR
        A      = 4'b1100;
        B      = 4'b1010;
        opcode = 3'b100;
        display_result("XOR");

        // 101 - NOT
        A      = 4'b1010;
        B      = 4'b0000;
        opcode = 3'b101;
        display_result("NOT");

        // 110 - RIGHT SHIFT
        A      = 4'b1011;
        B      = 4'b0000;
        opcode = 3'b110;
        display_result("RIGHT SHIFT");

        // 111 - LEFT SHIFT
        A      = 4'b1011;
        B      = 4'b0000;
        opcode = 3'b111;
        display_result("LEFT SHIFT");

        // ----------------------------------------
        // Zero flag test
        // ----------------------------------------
        A      = 4'b0101;
        B      = 4'b0101;
        opcode = 3'b001;
        display_result("ZERO FLAG TEST");

        // ----------------------------------------
        // Low-power enable test
        // ----------------------------------------
        enable = 1'b0;
        A      = 4'b1111;
        B      = 4'b1111;
        opcode = 3'b000;
        display_result("DISABLED ALU");

        // ----------------------------------------
        // Finish simulation
        // ----------------------------------------
        $display("==============================================");
        $display("          SIMULATION COMPLETED");
        $display("==============================================");

        $finish;

    end

endmodule