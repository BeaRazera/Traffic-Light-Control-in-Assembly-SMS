[ Português ](README.pt-BR.md) | **English**

# Traffic Light Control in Assembly (SMS)

A low-level Assembly project built for the SMS (Simple Machine Simulator) architecture (x86-based). The program controls an interactive pedestrian traffic light system using I/O ports.

## Features

- **Traffic Signal Control:** Toggles vehicle and pedestrian lights via I/O port manipulation.
- **Input Validation:** Listens for keyboard input to detect pedestrian requests ('P' or 'p').
- **Countdown Timer:** Displays countdown numbers on a 7-segment display using RAM-stored lookup tables.

## I/O Peripheral Mapping

| Port | Peripheral | Description |
| :--- | :--- | :--- |
| 00 | Keyboard | Reads user keypress (`IN 00`) |
| 01 | Traffic Light | Controls LED signals via bitmasking (`OUT 01`) |
| 02 | 7-Seg Display | Outputs numeric countdown (`OUT 02`) |

## Low-Level Concepts Applied

- General-purpose register manipulation (`AL`, `BL`)
- Hardware Input/Output instructions (`IN`, `OUT`)
- Conditional and unconditional jumps (`JMP`, `JZ`, `JNZ`)
- Subroutine calls and returns (`CALL`, `RET`)
- Direct memory mapping and byte arrays (`ORG`, `DB`)

## How to Run

1. Open the **Simple Machine Simulator (SMS)** environment.
2. Load the source code into the editor.
3. Assemble and run the program.
4. Focus on the **Keyboard** peripheral and press `P` to trigger the pedestrian crossing cycle.
