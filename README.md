# Low-Power ALU Design Using VLSI Techniques

## Overview

This project presents the RTL design and implementation of a 4-bit Arithmetic Logic Unit (ALU) using Verilog HDL, with a focus on low-power digital design techniques.

The ALU supports eight arithmetic, logical, and shift operations. An enable-based control mechanism is incorporated to keep the ALU inactive when operation is not required, reducing unnecessary switching activity.

The design was simulated, synthesized, implemented, and analyzed using Xilinx Vivado.

---

## Objectives

- Design a 4-bit ALU using Verilog HDL.
- Implement arithmetic, logical, and shift operations.
- Verify the functionality using a dedicated testbench.
- Analyze the synthesized RTL design.
- Evaluate FPGA resource utilization.
- Perform timing analysis.
- Perform post-implementation power estimation.
- Demonstrate an enable-based low-power design approach.

---

## ALU Specifications

| Parameter | Specification |
|-----------|---------------|
| ALU Width | 4-bit |
| Input A | 4-bit |
| Input B | 4-bit |
| Opcode | 3-bit |
| Enable | 1-bit |
| Output Y | 4-bit |
| Carry | 1-bit |
| Zero Flag | 1-bit |
| Number of Operations | 8 |
| HDL | Verilog |
| FPGA Tool | Xilinx Vivado |

---

## Supported Operations

| Opcode | Operation | Function |
|--------|-----------|----------|
| `000` | ADD | `A + B` |
| `001` | SUBTRACT | `A - B` |
| `010` | AND | `A & B` |
| `011` | OR | `A \| B` |
| `100` | XOR | `A ^ B` |
| `101` | NOT | `~A` |
| `110` | RIGHT SHIFT | `A >> 1` |
| `111` | LEFT SHIFT | `A << 1` |

---

## Low-Power Design Approach

The design uses an enable-based operation control.

When `enable = 1`, the ALU performs the selected operation.

When `enable = 0`, the ALU remains inactive and the outputs are driven to the inactive state.

This approach helps reduce unnecessary combinational switching when ALU operation is not required.

> Note: The project demonstrates an RTL-level low-power design approach. The Vivado power values are tool-based estimates and are not measured hardware power.

---

## Architecture


                  +----------------------+
                  |                      |
 A[3:0] ---------->                      |
                  |                      |
 B[3:0] ---------->    LOW-POWER        |------> Y[3:0]
                  |      4-BIT ALU       |
 Opcode[2:0] ----->                      |------> Carry
                  |                      |
 Enable ---------->                      |------> Zero
                  |                      |
                  +----------------------+