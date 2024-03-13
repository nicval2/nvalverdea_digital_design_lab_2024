module xor_16bit(
  input logic [15:0] a,
  input logic [15:0] b,
  output logic [15:0] result,
  output logic zero_flag
);

	assign result[0] = a[0] ^ b[0];
  assign result[1] = a[1] ^ b[1];
  assign result[2] = a[2] ^ b[2];
  assign result[3] = a[3] ^ b[3];
  assign result[4] = a[4] ^ b[1];
  assign result[5] = a[5] ^ b[2];
  assign result[6] = a[6] ^ b[3];
  assign result[7] = a[7] ^ b[1];
  assign result[8] = a[8] ^ b[2];
  assign result[9] = a[9] ^ b[3];
  assign result[10] = a[10] ^ b[10];
  assign result[11] = a[11] ^ b[11];
  assign result[12] = a[12] ^ b[12];
  assign result[13] = a[13] ^ b[13];
  assign result[14] = a[14] ^ b[14];
  assign result[15] = a[15] ^ b[15];

  // Set flags
  assign zero_flag = (result == 16'b0000000000000000);

endmodule