module xor_32bit(
  input logic [31:0] a,
  input logic [31:0] b,
  output logic [31:0] result,
  output logic zero_flag
);

	assign result[0] = a[0] ^ b[0];
  assign result[1] = a[1] ^ b[1];
  assign result[2] = a[2] ^ b[2];
  assign result[3] = a[3] ^ b[3];
  assign result[4] = a[4] ^ b[4];
  assign result[5] = a[5] ^ b[5];
  assign result[6] = a[6] ^ b[6];
  assign result[7] = a[7] ^ b[7];
  assign result[8] = a[8] ^ b[8];
  assign result[9] = a[9] ^ b[9];
  assign result[10] = a[10] ^ b[10];
  assign result[11] = a[11] ^ b[11];
  assign result[12] = a[12] ^ b[12];
  assign result[13] = a[13] ^ b[13];
  assign result[14] = a[14] ^ b[14];
  assign result[15] = a[15] ^ b[15];
  assign result[16] = a[16] ^ b[16];
  assign result[17] = a[17] ^ b[17];
  assign result[18] = a[18] ^ b[18];
  assign result[19] = a[19] ^ b[19];
  assign result[20] = a[20] ^ b[20];
  assign result[21] = a[21] ^ b[21];
  assign result[22] = a[22] ^ b[22];
  assign result[23] = a[23] ^ b[23];
  assign result[24] = a[24] ^ b[24];
  assign result[25] = a[25] ^ b[25];
  assign result[26] = a[26] ^ b[26];
  assign result[27] = a[27] ^ b[27];
  assign result[28] = a[28] ^ b[28];
  assign result[29] = a[28] ^ b[29];
  assign result[30] = a[30] ^ b[30];
  assign result[31] = a[31] ^ b[31];

  // Set flags
  assign zero_flag = (result == 32'b00000000000000000000000000000000);

endmodule