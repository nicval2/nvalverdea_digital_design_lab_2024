module subtractor_4bit(
  input logic [1:0] a,
  input logic [1:0] b,
  output logic [2:0] diff
);
  logic [2:0] borrow;

  assign borrow[0] = 0;
  assign borrow[1] = ~a[0] & b[0] | ~a[0] & borrow[0] | b[0] & borrow[0];
  assign borrow[2] = ~a[1] & b[1] | ~a[1] & borrow[1] | b[1] & borrow[1];

  assign diff[0] = a[0] ^ b[0] ^ borrow[0];
  assign diff[1] = a[1] ^ b[1] ^ borrow[1];
  assign diff[2] = borrow[2];
endmodule
