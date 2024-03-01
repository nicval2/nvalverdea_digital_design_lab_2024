module adder_4bit(
  input logic [1:0] a,
  input logic [1:0] b,
  output logic [2:0] sum
);
  logic [2:0] carry;

  assign carry[0] = 0;
  assign carry[1] = a[0] & b[0] | a[0] & carry[0] | b[0] & carry[0];
  assign carry[2] = a[1] & b[1] | a[1] & carry[1] | b[1] & carry[1];

  assign sum[0] = a[0] ^ b[0] ^ carry[0];
  assign sum[1] = a[1] ^ b[1] ^ carry[1];
  assign sum[2] = carry[2];
endmodule
