`timescale 1ns/1ps

module matrix_keyboard_scanner_tb;

    reg clk;
    reg reset;

    reg [3:0] col;
    wire [3:0] row;

    wire [3:0] key;
    wire key_valid;

    matrix_keyboard_scanner uut (
        .clk(clk),
        .reset(reset),
        .col(col),
        .row(row),
        .key(key),
        .key_valid(key_valid)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        $dumpfile("matrix_keyboard_scanner.vcd");
        $dumpvars(0, matrix_keyboard_scanner_tb);

        clk = 0;
        reset = 1;
        col = 4'b1111;

        #10;

        reset = 0;

        // No key pressed
        col = 4'b1111;
        #40;

        // Press key 1
        // Row 0 + Column 0
        col = 4'b1110;
        #10;
        col = 4'b1111;
        #30;

        // Press key 5
        // Row 1 + Column 1
        col = 4'b1111;
        #10;
        col = 4'b1101;
        #10;
        col = 4'b1111;
        #30;

        // Press key 9
        // Row 2 + Column 2
        col = 4'b1111;
        #20;
        col = 4'b1011;
        #10;
        col = 4'b1111;
        #30;

        // Press key D
        // Row 3 + Column 3
        col = 4'b1111;
        #20;
        col = 4'b0111;
        #10;
        col = 4'b1111;
        #30;

        $display("---------------------------------------");
        $display("     MATRIX KEYBOARD SCANNER");
        $display("---------------------------------------");

        $display("Final Row       = %b", row);
        $display("Final Key       = %h", key);
        $display("Key Valid       = %b", key_valid);

        $display("---------------------------------------");

        $finish;

    end

    always @(posedge clk) begin

        if (key_valid)
            $display(
                "Time=%0t | Row=%b | Column=%b | Key=%h",
                $time, row, col, key
            );

    end

endmodule