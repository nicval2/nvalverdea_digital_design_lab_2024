module divider_4bit(
    input logic [3:0] dividend,
    input logic [3:0] divisor,
    output logic [3:0] quotient,
    output logic overflow,
    output logic divide_by_zero
);

    always_comb begin
        if (divisor == 0|| dividend == 0) begin
            quotient = 4'b0000; // Indicate divide by zero
            overflow = 1'b0; // Clear overflow flag
            divide_by_zero = 1'b1; // Set divide by zero flag
        end
        else begin
            quotient = dividend / divisor;
            if (dividend >= 8'h8 && divisor == 4'b1111) // Overflow condition: dividend >= 8 and divisor is 15
                overflow = 1'b1; // Set overflow flag
            else
                overflow = 1'b0; // Clear overflow flag
            divide_by_zero = 1'b0; // Clear divide by zero flag
        end
    end
endmodule
