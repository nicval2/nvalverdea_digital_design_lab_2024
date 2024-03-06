module divider_2bit(
  input logic [1:0] dividend,
  input logic [1:0] divisor,
  output logic [1:0] quotient,
  output logic overflow,
  output logic divide_by_zero
  
);

    always_comb begin
        if (divisor == 0|| dividend == 0) begin
            quotient = 2'b00; // Indicate divide by zero
            overflow = 1'b0; // Clear overflow flag
            divide_by_zero = 1'b1; // Set divide by zero flag
        end
        else begin
            quotient = dividend / divisor;
            if (dividend >= 2'h2 && divisor == 2'b11) // Overflow condition: dividend >= 8 and divisor is 15
                overflow = 1'b1; // Set overflow flag
            else
                overflow = 1'b0; // Clear overflow flag
            divide_by_zero = 1'b0; // Clear divide by zero flag
        end
    end
endmodule