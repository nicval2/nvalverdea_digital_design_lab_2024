module subtractor_2bit(
  input logic [1:0] a,
  input logic [1:0] b,
  output logic [1:0] diff,
  output logic carry_out, // Carry-out flag
  output logic overflow, // Overflow flag
  output logic zero, // Zero flag
  output logic negative // Negative flag
);
  logic [2:0] borrow;

  assign borrow[0] = 1'b0;
  assign borrow[1] = ~a[0] & b[0] | ~a[0] & borrow[0] | b[0] & borrow[0];
  assign borrow[2] = ~a[1] & b[1] | ~a[1] & borrow[1] | b[1] & borrow[1];


  assign diff[0] = a[0] ^ b[0] ^ borrow[0];
  assign diff[1] = a[1] ^ b[1] ^ borrow[1];


  // Calculate carry-out flag
  assign carry_out = borrow[2];

  // Calculate overflow flag
  assign overflow = (a[1] & ~b[1] & ~diff[1]) | (~a[1] & b[1] & diff[1]);

  // Calculate zero flag
  assign zero = (diff[1] == 0) & (diff[0] == 0);

  // Calculate negative flag
  assign negative = diff[1];
endmodule