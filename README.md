4×4 Matrix Keyboard Scanner using Verilog HDL

1. Project Title

4×4 Matrix Keyboard Scanner using Verilog HDL

2. Introduction

A matrix keyboard is a commonly used input device in digital systems. Instead of requiring one input line for every key, the keys are arranged in rows and columns.

This project implements a 4×4 Matrix Keyboard Scanner using Verilog HDL. The scanner activates each row sequentially and checks the column inputs to determine which key is pressed.

3. Objective

The objectives of this project are:

- To design a 4×4 matrix keyboard scanner.
- To scan keypad rows sequentially.
- To detect the pressed column.
- To identify the corresponding key.
- To verify the design using a Verilog testbench.
- To observe the design using waveform simulation.

4. Keypad Configuration

The keypad contains 4 rows and 4 columns.

          C0    C1    C2    C3
          │     │     │     │
R0 ─────  1     4     7     A
R1 ─────  2     5     8     B
R2 ─────  3     6     9     C
R3 ─────  E     0     F     D

There are a total of 16 keys.

5. Working Principle

The scanner works by activating one row at a time.

Step 1

The first row is activated:

1110

The column inputs are checked.

Step 2

The second row is activated:

1101

The column inputs are checked again.

Step 3

The third row is activated:

1011

The column inputs are checked.

Step 4

The fourth row is activated:

0111

The column inputs are checked.

The process repeats continuously.

6. Block Diagram

             +----------------------+
             |                      |
Clock ------>|                      |
Reset ------>|  Matrix Keyboard     |
             |     Scanner          |
Columns ---->|                      |----> Rows
             |                      |
             |                      |----> Key
             |                      |
             |                      |----> Key Valid
             +----------------------+

7. Inputs and Outputs

Signal| Direction| Width| Description
"clk"| Input| 1| Clock
"reset"| Input| 1| Reset signal
"col"| Input| 4| Keyboard column inputs
"row"| Output| 4| Keyboard row scan signals
"key"| Output| 4| Detected key
"key_valid"| Output| 1| Indicates a detected key

8. Project Structure

Matrix-Keyboard-Scanner/
│
├── README.md
├── matrix_keyboard_scanner.v
├── matrix_keyboard_scanner_tb.v
└── simulation/
    └── simulation_output.txt

9. Files Description

"matrix_keyboard_scanner.v"

Contains the main Verilog implementation of the 4×4 matrix keyboard scanner.

"matrix_keyboard_scanner_tb.v"

Contains the testbench that simulates different key presses.

"simulation/simulation_output.txt"

Contains the expected console output from the simulation.

10. Key Detection Examples

Row| Column| Detected Key
1110| 1110| 1
1101| 1101| 5
1011| 1011| 9
0111| 0111| D

11. Technologies Used

- Verilog HDL
- Icarus Verilog
- GTKWave
- GitHub

12. Simulation

Compile the design and testbench:

iverilog -o matrix_scanner_sim matrix_keyboard_scanner.v matrix_keyboard_scanner_tb.v

Run the simulation:

vvp matrix_scanner_sim

The simulation generates:

matrix_keyboard_scanner.vcd

Open the waveform using:

gtkwave matrix_keyboard_scanner.vcd

13. Waveform Signals

The following signals can be viewed in GTKWave:

clk
reset
row
col
key
key_valid

The row signal continuously scans:

1110
1101
1011
0111

When a key is pressed, the corresponding column becomes active and the scanner identifies the key.

14. Expected Simulation Output

VCD info: dumpfile matrix_keyboard_scanner.vcd opened for output.

Time=15 | Row=1110 | Column=1110 | Key=1
Time=65 | Row=1101 | Column=1101 | Key=5
Time=105 | Row=1011 | Column=1011 | Key=9
Time=145 | Row=0111 | Column=0111 | Key=d

---------------------------------------
     MATRIX KEYBOARD SCANNER
---------------------------------------
Final Row       = 1110
Final Key       = d
Key Valid       = 0
---------------------------------------

15. Applications

Matrix keyboard scanners are used in:

- Computer keyboards
- Numeric keypads
- Security systems
- Password entry systems
- Digital locks
- Embedded systems
- FPGA-based projects
- Microcontroller systems

16. Advantages

1. Reduces the number of required input/output pins.
2. Supports multiple keys using row and column lines.
3. Simple digital logic implementation.
4. Easy to implement using Verilog HDL.
5. Suitable for FPGA and embedded-system projects.

17. Limitations

- A practical keyboard scanner should include switch debouncing.
- Multiple simultaneous key presses may require additional logic.
- A production design may require synchronization and more robust key detection.

18. Result

The 4×4 Matrix Keyboard Scanner was successfully designed using Verilog HDL.

The testbench successfully simulated different key presses and verified the corresponding row, column, and key outputs.

19. Conclusion

This project demonstrates how a matrix keyboard can be interfaced with a digital system using Verilog HDL. The scanner activates each row sequentially, reads the column inputs, and identifies the pressed key.

20. Author

Your Name

Project: 4×4 Matrix Keyboard Scanner using Verilog HDL