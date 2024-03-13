module subtractor_8bit(
  input logic [7:0] a,
  input logic [7:0] b,
  output logic [7:0] diff,
  output logic carry_out, // Carry-out flag
  output logic overflow, // Overflow flag
  output logic zero, // Zero flag
  output logic negative // Negative flag
);
  logic [8:0] borrow;

  assign borrow[0] = 1'b0;
  assign borrow[1] = ~a[0] & b[0] | ~a[0] & borrow[0] | b[0] & borrow[0];
  assign borrow[2] = ~a[1] & b[1] | ~a[1] & borrow[1] | b[1] & borrow[1];
  assign borrow[3] = ~a[2] & b[2] | ~a[2] & borrow[2] | b[2] & borrow[2];
  assign borrow[4] = ~a[3] & b[3] | ~a[3] & borrow[3] | b[3] & borrow[3];
  assign borrow[5] = ~a[4] & b[4] | ~a[4] & borrow[4] | b[4] & borrow[4];
  assign borrow[6] = ~a[5] & b[5] | ~a[5] & borrow[5] | b[5] & borrow[5];
  assign borrow[7] = ~a[6] & b[6] | ~a[6] & borrow[6] | b[6] & borrow[6];
  assign borrow[8] = ~a[7] & b[7] | ~a[7] & borrow[7] | b[7] & borrow[7];
 

  assign diff[0] = a[0] ^ b[0] ^ borrow[0];
  assign diff[1] = a[1] ^ b[1] ^ borrow[1];
  assign diff[2] = a[2] ^ b[2] ^ borrow[2];
  assign diff[3] = a[3] ^ b[3] ^ borrow[3];
  assign diff[4] = a[4] ^ b[4] ^ borrow[4];
  assign diff[5] = a[5] ^ b[5] ^ borrow[5];
  assign diff[6] = a[6] ^ b[6] ^ borrow[6];
  assign diff[7] = a[7] ^ b[7] ^ borrow[7];

  // Calculate carry-out flag
  assign carry_out = borrow[8];

  // Calculate overflow flag
  assign overflow = (a[7] & ~b[7] & ~diff[7]) | (~a[7] & b[7] & diff[7]);

  // Calculate zero flag
  assign zero  = (diff[7] == 0) & (diff[6] == 0) & (diff[5] == 0) & (diff[4] == 0) & (diff[3] == 0) & (diff[2] == 0) & (diff[1] == 0) & (diff[0] == 0);

  // Calculate negative flag
  assign negative = diff[7];
  
endmodule