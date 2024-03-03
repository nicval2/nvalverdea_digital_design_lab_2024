module subtractor_4bit(
  input logic [3:0] a,
  input logic [3:0] b,
  output logic [3:0] diff,
  output logic carry_out, // Carry-out flag
  output logic overflow, // Overflow flag
  output logic zero, // Zero flag
  output logic negative // Negative flag
);
  logic [4:0] borrow;

  assign borrow[0] = 1'b0;
  assign borrow[1] = ~a[0] & b[0] | ~a[0] & borrow[0] | b[0] & borrow[0];
  assign borrow[2] = ~a[1] & b[1] | ~a[1] & borrow[1] | b[1] & borrow[1];
  assign borrow[3] = ~a[2] & b[2] | ~a[2] & borrow[2] | b[2] & borrow[2];
  assign borrow[4] = ~a[3] & b[3] | ~a[3] & borrow[3] | b[3] & borrow[3];

  assign diff[0] = a[0] ^ b[0] ^ borrow[0];
  assign diff[1] = a[1] ^ b[1] ^ borrow[1];
  assign diff[2] = a[2] ^ b[2] ^ borrow[2];
  assign diff[3] = a[3] ^ b[3] ^ borrow[3];

  // Calculate carry-out flag
  assign carry_out = borrow[3];

  // Calculate overflow flag
  assign overflow = (a[3] & ~b[3] & ~diff[3]) | (~a[3] & b[3] & diff[3]);

  // Calculate zero flag
  assign zero = (diff[3] == 0) & (diff[2] == 0) & (diff[1] == 0) & (diff[0] == 0);

  // Calculate negative flag
  assign negative = diff[3];
endmodule