module adder_2bit(
  input logic [1:0] a,
  input logic [1:0] b,
  output logic [1:0] sum,
  output logic carry_out, // Carry-out flag
  output logic overflow, // Overflow flag
  output logic zero // Zero flag
);
  logic [2:0] carry;

  assign carry[0] = 1'b0;
  assign carry[1] = a[0] & b[0] | a[0] & carry[0] | b[0] & carry[0];
  assign carry[2] = a[1] & b[1] | a[1] & carry[1] | b[1] & carry[1];

  assign sum[0] = a[0] ^ b[0] ^ carry[0];
  assign sum[1] = a[1] ^ b[1] ^ carry[1];

  // Calculate carry-out flag
  assign carry_out = (a[1] & b[1] & ~sum[1]) | (~a[1] & ~b[1] & sum[1]);

  // Calculate overflow flag
  assign overflow = carry[2];

  // Calculate zero flag
  assign zero = ((sum == 2'b0) & !overflow);
endmodule