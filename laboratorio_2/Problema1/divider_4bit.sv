module divider_4bit(
  input logic [3:0] dividend,
  input logic [3:0] divisor,
  output logic [3:0] quotient,
  output logic overflow,
  output logic zero
  
);

  logic [3:0] temp_remainder;
  logic [3:0] temp_quotient;
  logic carry_out;
  logic negative;

  subtractor_4bit subtractor (
    .a(temp_remainder),
    .b(divisor),
    .diff(temp_remainder),
    .carry_out(carry_out),
    .overflow(overflow),
    .zero(zero),
    .negative(negative)
  );

  // Initialize temporary variables
  initial begin
    temp_remainder = dividend;
    temp_quotient = 4'b0000;
  end

  // Subtraction loop
  always @(*) begin
    if (temp_remainder >= divisor) begin
      temp_quotient = temp_quotient + 1'b1;
    end
  end

  // Assign outputs
  assign quotient = temp_quotient;
  assign remainder = temp_remainder;

endmodule
