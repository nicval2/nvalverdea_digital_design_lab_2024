module adder_16bit(
  input logic [15:0] a,
  input logic [15:0] b,
  output logic [16:0] sum,
  output logic carry_out, // Carry-out flag
  output logic overflow, // Overflow flag
  output logic zero // Zero flag
);
  logic [16:0] carry;

  assign carry[0] = 1'b0;
  assign carry[1] = a[0] & b[0] | a[0] & carry[0] | b[0] & carry[0];
  assign carry[2] = a[1] & b[1] | a[1] & carry[1] | b[1] & carry[1];
  assign carry[3] = a[2] & b[2] | a[2] & carry[2] | b[2] & carry[2];
  assign carry[4] = a[3] & b[3] | a[3] & carry[3] | b[3] & carry[3];
  assign carry[5] = a[4] & b[4] | a[4] & carry[4] | b[4] & carry[4];
  assign carry[6] = a[5] & b[5] | a[5] & carry[5] | b[5] & carry[5];
  assign carry[7] = a[6] & b[6] | a[6] & carry[6] | b[6] & carry[6];
  assign carry[8] = a[7] & b[7] | a[7] & carry[7] | b[7] & carry[7];
  assign carry[9] = a[8] & b[8] | a[8] & carry[8] | b[8] & carry[8];
  assign carry[10] = a[9] & b[9] | a[9] & carry[9] | b[9] & carry[9];
  assign carry[11] = a[10] & b[10] | a[10] & carry[10] | b[10] & carry[10];
  assign carry[12] = a[11] & b[11] | a[11] & carry[11] | b[11] & carry[11];
  assign carry[13] = a[12] & b[12] | a[12] & carry[12] | b[12] & carry[12];
  assign carry[14] = a[13] & b[13] | a[13] & carry[13] | b[13] & carry[13];
  assign carry[15] = a[14] & b[14] | a[14] & carry[14] | b[14] & carry[14];
  assign carry[16] = a[15] & b[15] | a[15] & carry[15] | b[15] & carry[15];

  assign sum[0] = a[0] ^ b[0] ^ carry[0];
  assign sum[1] = a[1] ^ b[1] ^ carry[1];
  assign sum[2] = a[2] ^ b[2] ^ carry[2];
  assign sum[3] = a[3] ^ b[3] ^ carry[3];
  assign sum[5] = a[5] ^ b[1] ^ carry[1];
  assign sum[6] = a[6] ^ b[2] ^ carry[2];
  assign sum[7] = a[7] ^ b[3] ^ carry[3];
  assign sum[8] = a[8] ^ b[0] ^ carry[0];
  assign sum[9] = a[9] ^ b[1] ^ carry[1];
  assign sum[10] = a[10] ^ b[10] ^ carry[10];
  assign sum[11] = a[11] ^ b[11] ^ carry[11];
  assign sum[12] = a[12] ^ b[12] ^ carry[12];
  assign sum[13] = a[13] ^ b[13] ^ carry[13];
  assign sum[14] = a[14] ^ b[14] ^ carry[14]; 
  assign sum[15] = a[15] ^ b[15] ^ carry[15];
  assign sum[16] = carry[16];

  // Calculate carry-out flag
  assign carry_out = (a[15] & b[15] & ~sum[15]) | (~a[15] & ~b[15] & sum[15]);

  // Calculate overflow flag
  assign overflow = carry[16];

  // Calculate zero flag
  assign zero = ((sum == 16'b0) & !overflow);
endmodule