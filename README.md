# Low-Power ALU Design Using VLSI Techniques

## Overview

This project presents the RTL design and implementation of a **4-bit Arithmetic Logic Unit (ALU)** using Verilog HDL, with a focus on an enable-based low-power digital design approach.

The ALU supports eight arithmetic, logical, and shift operations selected using a 3-bit opcode. An enable-based control mechanism is incorporated to keep the ALU inactive when operation is not required, thereby reducing unnecessary combinational activity.

The design was functionally verified using a dedicated Verilog testbench and subsequently synthesized, implemented, and analyzed using **Xilinx Vivado**.

---

## Objectives

- Design a 4-bit ALU using Verilog HDL.
- Implement arithmetic, logical, and shift operations.
- Incorporate enable-based operation control.
- Verify the functionality using a dedicated testbench.
- Analyze the synthesized RTL design.
- Evaluate FPGA resource utilization.
- Perform timing analysis.
- Perform post-implementation power estimation.
- Demonstrate an RTL-level low-power design approach.
- Prepare the design for FPGA hardware implementation.

---

## ALU Specifications

| **Parameter**        | **Specification** |
| -------------------- | ----------------- |
| ALU Width            | 4-bit             |
| Input A              | 4-bit             |
| Input B              | 4-bit             |
| Opcode               | 3-bit             |
| Enable               | 1-bit             |
| Output Y             | 4-bit             |
| Carry                | 1-bit             |
| Zero Flag            | 1-bit             |
| Number of Operations | 8                 |
| Architecture         | Combinational     |
| HDL                  | Verilog           |
| FPGA Tool            | Xilinx Vivado     |
| Target FPGA          | Artix-7           |

---

## Supported Operations

| **Opcode** | **Operation** | **Function** |
| ---------- | ------------- | ------------ |
| `000`      | ADD           | `A + B`      |
| `001`      | SUBTRACT      | `A - B`      |
| `010`      | AND           | `A & B`      |
| `011`      | OR            | `A \| B`     |
| `100`      | XOR           | `A ^ B`      |
| `101`      | NOT           | `~A`         |
| `110`      | RIGHT SHIFT   | `A >> 1`     |
| `111`      | LEFT SHIFT    | `A << 1`     |

---

## Low-Power Design Approach

The design uses an **enable-based operation control** technique.

When:

```text
enable = 1