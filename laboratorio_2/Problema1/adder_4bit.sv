module adder_4bit(
  input logic [3:0] a,
  input logic [3:0] b,
  output logic [4:0] sum
);
  logic [4:0] carry;

  assign carry[0] = 0;
  assign carry[1] = a[0] & b[0] | a[0] & carry[0] | b[0] & carry[0];
  assign carry[2] = a[1] & b[1] | a[1] & carry[1] | b[1] & carry[1];
  assign carry[3] = a[2] & b[2] | a[2] & carry[2] | b[2] & carry[2];
  assign carry[4] = a[3] & b[3] | a[3] & carry[3] | b[3] & carry[3];

  assign sum[0] = a[0] ^ b[0] ^ carry[0];
  assign sum[1] = a[1] ^ b[1] ^ carry[1];
  assign sum[2] = a[2] ^ b[2] ^ carry[2];
  assign sum[3] = a[3] ^ b[3] ^ carry[3];
  assign sum[4] = carry[4];
endmodule
