module adder_8bit(
  input logic [7:0] a,
  input logic [7:0] b,
  output logic [8:0] sum,
  output logic carry_out, // Carry-out flag
  output logic overflow, // Overflow flag
  output logic zero // Zero flag
);
  logic [8:0] carry;

  assign carry[0] = 1'b0;
  assign carry[1] = a[0] & b[0] | a[0] & carry[0] | b[0] & carry[0];
  assign carry[2] = a[1] & b[1] | a[1] & carry[1] | b[1] & carry[1];
  assign carry[3] = a[2] & b[2] | a[2] & carry[2] | b[2] & carry[2];
  assign carry[4] = a[3] & b[3] | a[3] & carry[3] | b[3] & carry[3];
  assign carry[5] = a[4] & b[4] | a[4] & carry[4] | b[4] & carry[4];
  assign carry[6] = a[5] & b[5] | a[5] & carry[5] | b[5] & carry[5];
  assign carry[7] = a[6] & b[6] | a[6] & carry[6] | b[6] & carry[6];
  assign carry[8] = a[7] & b[7] | a[7] & carry[7] | b[7] & carry[7];


  assign sum[0] = a[0] ^ b[0] ^ carry[0];
  assign sum[1] = a[1] ^ b[1] ^ carry[1];
  assign sum[2] = a[2] ^ b[2] ^ carry[2];
  assign sum[3] = a[3] ^ b[3] ^ carry[3];
  assign sum[4] = a[4] ^ b[4] ^ carry[4];
  assign sum[5] = a[5] ^ b[5] ^ carry[5];
  assign sum[6] = a[6] ^ b[6] ^ carry[6];
  assign sum[7] = a[7] ^ b[7] ^ carry[7];
  assign sum[8] = a[7] ^ b[7] ^ carry[8];
  

  // Calculate carry-out flag
  assign carry_out = (a[7] & b[7] & ~sum[7]) | (~a[7] & ~b[7] & sum[7]);

  // Calculate overflow flag
  assign overflow = carry[8];

  // Calculate zero flag
  assign zero = ((sum == 16'b0) & !overflow);
endmodule