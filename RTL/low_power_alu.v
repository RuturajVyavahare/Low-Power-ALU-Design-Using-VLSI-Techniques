`timescale 1ns / 1ps

module low_power_alu (
    input  wire [3:0] A,
    input  wire [3:0] B,
    input  wire [2:0] opcode,
    input  wire       enable,

    output reg  [3:0] Y,
    output reg        carry,
    output reg        zero
);

    reg [4:0] temp;

    always @(*) begin

        // Default values
        Y     = 4'b0000;
        carry = 1'b0;
        temp  = 5'b00000;

        // Low-power enable control
        if (enable) begin

            case (opcode)

                // 000 - Addition
                3'b000: begin
                    temp  = {1'b0, A} + {1'b0, B};
                    Y     = temp[3:0];
                    carry = temp[4];
                end

                // 001 - Subtraction
                3'b001: begin
                    Y     = A - B;
                    carry = (A >= B);
                end

                // 010 - AND
                3'b010: begin
                    Y = A & B;
                end

                // 011 - OR
                3'b011: begin
                    Y = A | B;
                end

                // 100 - XOR
                3'b100: begin
                    Y = A ^ B;
                end

                // 101 - NOT
                3'b101: begin
                    Y = ~A;
                end

                // 110 - Right Shift
                3'b110: begin
                    carry = A[0];
                    Y     = A >> 1;
                end

                // 111 - Left Shift
                3'b111: begin
                    carry = A[3];
                    Y     = A << 1;
                end

                default: begin
                    Y     = 4'b0000;
                    carry = 1'b0;
                end

            endcase
        end

        // Zero flag
        if (enable && (Y == 4'b0000))
            zero = 1'b1;
        else
            zero = 1'b0;

    end

endmodule