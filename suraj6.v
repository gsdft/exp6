module suraj6 (
    input wire clk,     // Clock input
    input wire reset,   // Asynchronous reset
    input wire S,       // Set input
    input wire R,       // Reset input
    output reg Q        // Output
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 1'b0;             // Asynchronous reset
        else begin
            case ({S, R})
                2'b10: Q <= 1'b1;  // Set
                2'b01: Q <= 1'b0;  // Reset
                2'b00: Q <= Q;     // Hold
                2'b11: Q <= 1'bx;  // Invalid condition
            endcase
        end
    end

endmodule