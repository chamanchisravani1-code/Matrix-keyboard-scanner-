module matrix_keyboard_scanner (
    input        clk,
    input        reset,

    input  [3:0] col,
    output reg [3:0] row,

    output reg [3:0] key,
    output reg       key_valid
);

    reg [1:0] scan_count;

    always @(posedge clk or posedge reset) begin

        if (reset) begin
            scan_count <= 2'b00;
            row        <= 4'b1110;
            key        <= 4'b0000;
            key_valid  <= 1'b0;
        end

        else begin

            key_valid <= 1'b0;

            case (scan_count)

                2'b00: begin
                    row <= 4'b1110;

                    if (col != 4'b1111) begin
                        key_valid <= 1'b1;

                        case (col)
                            4'b1110: key <= 4'h1;
                            4'b1101: key <= 4'h4;
                            4'b1011: key <= 4'h7;
                            4'b0111: key <= 4'hA;
                            default: key <= 4'h0;
                        endcase
                    end

                    scan_count <= 2'b01;
                end

                2'b01: begin
                    row <= 4'b1101;

                    if (col != 4'b1111) begin
                        key_valid <= 1'b1;

                        case (col)
                            4'b1110: key <= 4'h2;
                            4'b1101: key <= 4'h5;
                            4'b1011: key <= 4'h8;
                            4'b0111: key <= 4'hB;
                            default: key <= 4'h0;
                        endcase
                    end

                    scan_count <= 2'b10;
                end

                2'b10: begin
                    row <= 4'b1011;

                    if (col != 4'b1111) begin
                        key_valid <= 1'b1;

                        case (col)
                            4'b1110: key <= 4'h3;
                            4'b1101: key <= 4'h6;
                            4'b1011: key <= 4'h9;
                            4'b0111: key <= 4'hC;
                            default: key <= 4'h0;
                        endcase
                    end

                    scan_count <= 2'b11;
                end

                2'b11: begin
                    row <= 4'b0111;

                    if (col != 4'b1111) begin
                        key_valid <= 1'b1;

                        case (col)
                            4'b1110: key <= 4'hE;
                            4'b1101: key <= 4'h0;
                            4'b1011: key <= 4'hF;
                            4'b0111: key <= 4'hD;
                            default: key <= 4'h0;
                        endcase
                    end

                    scan_count <= 2'b00;
                end

            endcase
        end
    end

endmodule