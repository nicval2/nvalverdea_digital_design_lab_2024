module subtractor_32bit(
  input logic [31:0] a,
  input logic [31:0] b,
  output logic [32:0] diff,
  output logic carry_out, // Carry-out flag
  output logic overflow, // Overflow flag
  output logic zero, // Zero flag
  output logic negative // Negative flag
);
  logic [32:0] borrow;

  assign borrow[0] = 1'b0;
  assign borrow[1] = ~a[0] & b[0] | ~a[0] & borrow[0] | b[0] & borrow[0];
  assign borrow[2] = ~a[1] & b[1] | ~a[1] & borrow[1] | b[1] & borrow[1];
  assign borrow[3] = ~a[2] & b[2] | ~a[2] & borrow[2] | b[2] & borrow[2];
  assign borrow[4] = ~a[3] & b[3] | ~a[3] & borrow[3] | b[3] & borrow[3];
  assign borrow[5] = ~a[4] & b[4] | ~a[4] & borrow[4] | b[4] & borrow[4];
  assign borrow[6] = ~a[5] & b[5] | ~a[5] & borrow[5] | b[5] & borrow[5];
  assign borrow[7] = ~a[6] & b[6] | ~a[6] & borrow[6] | b[6] & borrow[6];
  assign borrow[8] = ~a[7] & b[7] | ~a[7] & borrow[7] | b[7] & borrow[7];
  assign borrow[9] = ~a[8] & b[8] | ~a[8] & borrow[8] | b[8] & borrow[8];
  assign borrow[10] = ~a[9] & b[9] | ~a[9] & borrow[9] | b[9] & borrow[9];
  assign borrow[11] = ~a[10] & b[10] | ~a[10] & borrow[10] | b[10] & borrow[10];
  assign borrow[12] = ~a[11] & b[11] | ~a[11] & borrow[11] | b[11] & borrow[11];
  assign borrow[13] = ~a[12] & b[12] | ~a[12] & borrow[12] | b[12] & borrow[12];
  assign borrow[14] = ~a[13] & b[13] | ~a[13] & borrow[13] | b[13] & borrow[13];
  assign borrow[15] = ~a[14] & b[14] | ~a[14] & borrow[14] | b[14] & borrow[14];
  assign borrow[16] = ~a[15] & b[15] | ~a[15] & borrow[15] | b[15] & borrow[15];
  assign borrow[17] = ~a[16] & b[16] | ~a[16] & borrow[16] | b[16] & borrow[16];
  assign borrow[18] = ~a[17] & b[17] | ~a[17] & borrow[17] | b[17] & borrow[17];
  assign borrow[19] = ~a[18] & b[18] | ~a[18] & borrow[18] | b[18] & borrow[18];
  assign borrow[20] = ~a[19] & b[19] | ~a[19] & borrow[19] | b[19] & borrow[19];
  assign borrow[21] = ~a[20] & b[20] | ~a[20] & borrow[20] | b[20] & borrow[20];
  assign borrow[22] = ~a[21] & b[21] | ~a[21] & borrow[21] | b[21] & borrow[21];
  assign borrow[23] = ~a[22] & b[22] | ~a[22] & borrow[22] | b[22] & borrow[22];
  assign borrow[24] = ~a[23] & b[23] | ~a[23] & borrow[23] | b[23] & borrow[23];
  assign borrow[25] = ~a[24] & b[24] | ~a[24] & borrow[24] | b[24] & borrow[24];
  assign borrow[26] = ~a[25] & b[25] | ~a[25] & borrow[25] | b[25] & borrow[25];
  assign borrow[27] = ~a[26] & b[26] | ~a[26] & borrow[26] | b[26] & borrow[26];
  assign borrow[28] = ~a[27] & b[27] | ~a[27] & borrow[27] | b[27] & borrow[27];
  assign borrow[29] = ~a[28] & b[28] | ~a[28] & borrow[28] | b[28] & borrow[28];
  assign borrow[30] = ~a[29] & b[29] | ~a[29] & borrow[29] | b[29] & borrow[29];
  assign borrow[31] = ~a[30] & b[30] | ~a[30] & borrow[30] | b[30] & borrow[30];
  assign borrow[32] = ~a[31] & b[31] | ~a[31] & borrow[31] | b[31] & borrow[31];

  assign diff[0] = a[0] ^ b[0] ^ borrow[0];
  assign diff[1] = a[1] ^ b[1] ^ borrow[1];
  assign diff[2] = a[2] ^ b[2] ^ borrow[2];
  assign diff[3] = a[3] ^ b[3] ^ borrow[3];
  assign diff[4] = a[4] ^ b[0] ^ borrow[0];
  assign diff[5] = a[5] ^ b[1] ^ borrow[1];
  assign diff[6] = a[6] ^ b[2] ^ borrow[2];
  assign diff[7] = a[7] ^ b[3] ^ borrow[3];
  assign diff[8] = a[8] ^ b[0] ^ borrow[0];
  assign diff[9] = a[9] ^ b[1] ^ borrow[1];
  assign diff[10] = a[10] ^ b[10] ^ borrow[10];
  assign diff[11] = a[11] ^ b[11] ^ borrow[11];
  assign diff[12] = a[12] ^ b[12] ^ borrow[12];
  assign diff[13] = a[13] ^ b[13] ^ borrow[13];
  assign diff[14] = a[14] ^ b[14] ^ borrow[14];
  assign diff[15] = a[15] ^ b[15] ^ borrow[15];
  assign diff[16] = a[16] ^ b[16] ^ borrow[16];
  assign diff[17] = a[17] ^ b[17] ^ borrow[17];
  assign diff[18] = a[18] ^ b[18] ^ borrow[18];
  assign diff[19] = a[19] ^ b[19] ^ borrow[19];
  assign diff[20] = a[20] ^ b[20] ^ borrow[20];
  assign diff[21] = a[21] ^ b[21] ^ borrow[21];
  assign diff[22] = a[22] ^ b[22] ^ borrow[22];
  assign diff[23] = a[23] ^ b[23] ^ borrow[23];
  assign diff[24] = a[24] ^ b[24] ^ borrow[24];
  assign diff[25] = a[25] ^ b[25] ^ borrow[25];
  assign diff[26] = a[26] ^ b[26] ^ borrow[26];
  assign diff[27] = a[27] ^ b[27] ^ borrow[27];
  assign diff[28] = a[28] ^ b[28] ^ borrow[28];
  assign diff[29] = a[29] ^ b[29] ^ borrow[29];
  assign diff[30] = a[30] ^ b[30] ^ borrow[30];
  assign diff[31] = a[31] ^ b[31] ^ borrow[31];

  // Calculate carry-out flag
  assign carry_out = borrow[31];

  // Calculate overflow flag
  assign overflow = (a[31] & ~b[31] & ~diff[31]) | (~a[31] & b[31] & diff[31]);

  // Calculate zero flag
  assign zero = (diff[31] == 0) & (diff[30] == 0) & (diff[29] == 0)& (diff[28] == 0)& (diff[27] == 0)& (diff[26] == 0)& (diff[25] == 0)& (diff[24] == 0)& (diff[23] == 0) & (diff[22] == 0) & (diff[21] == 0) & (diff[20] == 0) & (diff[19] == 0)& (diff[18] == 0)  & (diff[17] == 0)& (diff[16] == 0)  & (diff[15] == 0)& (diff[14] == 0)  & (diff[13] == 0)& (diff[12] == 0)  & (diff[11] == 0)& (diff[10] == 0) & (diff[9] == 0) & (diff[8] == 0) & (diff[7] == 0)  & (diff[6] == 0) & (diff[5] == 0)  & (diff[4] == 0) & (diff[3] == 0) & (diff[2] == 0) & (diff[1] == 0) & (diff[0] == 0);

  // Calculate negative flag
  assign negative = diff[31];
endmodule