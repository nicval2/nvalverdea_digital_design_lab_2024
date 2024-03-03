module adder_4bit(
  input logic [3:0] a,
  input logic [3:0] b,
  output logic [3:0] sum,
  output logic carry_out, // Carry-out flag
  output logic overflow, // Overflow flag
  output logic zero // Zero flag
);
  logic [4:0] carry;

  assign carry[0] = 1'b0;
  assign carry[1] = a[0] & b[0] | a[0] & carry[0] | b[0] & carry[0];
  assign carry[2] = a[1] & b[1] | a[1] & carry[1] | b[1] & carry[1];
  assign carry[3] = a[2] & b[2] | a[2] & carry[2] | b[2] & carry[2];
  assign carry[4] = a[3] & b[3] | a[3] & carry[3] | b[3] & carry[3];

  assign sum[0] = a[0] ^ b[0] ^ carry[0];
  assign sum[1] = a[1] ^ b[1] ^ carry[1];
  assign sum[2] = a[2] ^ b[2] ^ carry[2];
  assign sum[3] = a[3] ^ b[3] ^ carry[3];

  // Calculate carry-out flag
  assign carry_out = (a[3] & b[3] & ~sum[3]) | (~a[3] & ~b[3] & sum[3]);

  // Calculate overflow flag
  assign overflow = carry[4];

  // Calculate zero flag
  assign zero = ((sum == 4'b0) & !overflow);
endmodule
