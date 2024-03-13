module subtractor_16bit(
  input logic [15:0] a,
  input logic [15:0] b,
  output logic [16:0] diff,
  output logic carry_out, // Carry-out flag
  output logic overflow, // Overflow flag
  output logic zero, // Zero flag
  output logic negative // Negative flag
);
  logic [16:0] borrow;

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

  // Calculate carry-out flag
  assign carry_out = borrow[15];

  // Calculate overflow flag
  assign overflow = (a[15] & ~b[15] & ~diff[15]) | (~a[15] & b[15] & diff[15]);

  // Calculate zero flag
  assign zero = (diff[15] == 0) & (diff[14] == 0)  & (diff[13] == 0)& (diff[12] == 0) & (diff[11] == 0)& (diff[10] == 0) & (diff[9] == 0) & (diff[8] == 0) & (diff[7] == 0)  & (diff[6] == 0) & (diff[5] == 0)  & (diff[4] == 0) & (diff[3] == 0) & (diff[2] == 0) & (diff[1] == 0) & (diff[0] == 0);


  // Calculate negative flag
  assign negative = diff[15];
endmodule