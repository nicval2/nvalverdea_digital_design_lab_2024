module subtractor_4bit(
  input logic [3:0] a,
  input logic [3:0] b,
  output logic [4:0] diff
);
  logic [4:0] borrow;

  assign borrow[0] = 0;
  assign borrow[1] = ~a[0] & b[0] | ~a[0] & borrow[0] | b[0] & borrow[0];
  assign borrow[2] = ~a[1] & b[1] | ~a[1] & borrow[1] | b[1] & borrow[1];
  assign borrow[3] = ~a[2] & b[2] | ~a[2] & borrow[2] | b[2] & borrow[2];
  assign borrow[4] = ~a[3] & b[3] | ~a[3] & borrow[3] | b[3] & borrow[3];

  assign diff[0] = a[0] ^ b[0] ^ borrow[0];
  assign diff[1] = a[1] ^ b[1] ^ borrow[1];
  assign diff[2] = a[2] ^ b[2] ^ borrow[2];
  assign diff[3] = a[3] ^ b[3] ^ borrow[3];
  assign diff[4] = borrow[4];
endmodule
