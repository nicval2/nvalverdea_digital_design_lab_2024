module adder_32bit(
  input logic [31:0] a,
  input logic [31:0] b,
  output logic [31:0] sum,
  output logic carry_out, // Carry-out flag
  output logic overflow, // Overflow flag
  output logic zero // Zero flag
);
  logic [32:0] carry;

  assign carry[0] = 1'b0;
  assign carry[1] = a[0] & b[0] | a[0] & carry[0] | b[0] & carry[0];
  assign carry[2] = a[1] & b[1] | a[1] & carry[1] | b[1] & carry[1];
  assign carry[3] = a[2] & b[2] | a[2] & carry[2] | b[2] & carry[2];
  assign carry[4] = a[3] & b[3] | a[3] & carry[3] | b[3] & carry[3];
  assign carry[5] = a[4] & b[4] | a[4] & carry[4] | b[4] & carry[4];
  assign carry[6] = a[5] & b[5] | a[5] & carry[5] | b[5] & carry[5];
  assign carry[7] = a[6] & b[6] | a[6] & carry[6] | b[6] & carry[6];
  assign carry[8] = a[7] & b[7] | a[7] & carry[7] | b[7] & carry[7];
  assign carry[9] = a[8] & b[8] | a[8] & carry[8] | b[8] & carry[8];
  assign carry[10] = a[9] & b[9] | a[9] & carry[9] | b[9] & carry[9];
  assign carry[11] = a[10] & b[10] | a[10] & carry[10] | b[10] & carry[10];
  assign carry[12] = a[11] & b[11] | a[11] & carry[11] | b[11] & carry[11];
  assign carry[13] = a[12] & b[12] | a[12] & carry[12] | b[12] & carry[12];
  assign carry[14] = a[13] & b[13] | a[13] & carry[13] | b[13] & carry[13];
  assign carry[15] = a[14] & b[14] | a[14] & carry[14] | b[14] & carry[14];
  assign carry[16] = a[15] & b[15] | a[15] & carry[15] | b[15] & carry[15];
  assign carry[17] = a[16] & b[16] | a[16] & carry[16] | b[16] & carry[16];
  assign carry[18] = a[17] & b[17] | a[17] & carry[17] | b[17] & carry[17];
  assign carry[19] = a[18] & b[18] | a[18] & carry[18] | b[18] & carry[18];
  assign carry[20] = a[19] & b[19] | a[19] & carry[19] | b[19] & carry[19];
  assign carry[21] = a[20] & b[20] | a[20] & carry[20] | b[20] & carry[20];
  assign carry[22] = a[21] & b[21] | a[21] & carry[21] | b[21] & carry[21];
  assign carry[23] = a[22] & b[22] | a[22] & carry[22] | b[22] & carry[22];
  assign carry[24] = a[23] & b[23] | a[23] & carry[23] | b[23] & carry[23];
  assign carry[25] = a[24] & b[24] | a[24] & carry[24] | b[24] & carry[24];
  assign carry[26] = a[25] & b[25] | a[25] & carry[25] | b[25] & carry[25];
  assign carry[27] = a[26] & b[26] | a[26] & carry[26] | b[26] & carry[26];
  assign carry[28] = a[27] & b[27] | a[27] & carry[27] | b[27] & carry[27];
  assign carry[29] = a[28] & b[28] | a[28] & carry[28] | b[28] & carry[28];
  assign carry[30] = a[29] & b[29] | a[29] & carry[29] | b[29] & carry[29];
  assign carry[31] = a[30] & b[30] | a[30] & carry[30] | b[30] & carry[30];
  assign carry[32] = a[31] & b[31] | a[31] & carry[31] | b[31] & carry[31];


  assign sum[0] = a[0] ^ b[0] ^ carry[0];
  assign sum[1] = a[1] ^ b[1] ^ carry[1];
  assign sum[2] = a[2] ^ b[2] ^ carry[2];
  assign sum[3] = a[3] ^ b[3] ^ carry[3];
  assign sum[4] = a[4] ^ b[0] ^ carry[0];
  assign sum[5] = a[5] ^ b[1] ^ carry[1];
  assign sum[6] = a[6] ^ b[2] ^ carry[2];
  assign sum[7] = a[7] ^ b[3] ^ carry[3];
  assign sum[8] = a[8] ^ b[0] ^ carry[0];
  assign sum[9] = a[9] ^ b[1] ^ carry[1];
  assign sum[10] = a[10] ^ b[10] ^ carry[10];
  assign sum[11] = a[11] ^ b[11] ^ carry[11];
  assign sum[12] = a[12] ^ b[12] ^ carry[12];
  assign sum[13] = a[13] ^ b[13] ^ carry[13];
  assign sum[14] = a[14] ^ b[14] ^ carry[14]; 
  assign sum[15] = a[15] ^ b[15] ^ carry[15];
  assign sum[16] = a[16] ^ b[16] ^ carry[16];
  assign sum[17] = a[17] ^ b[17] ^ carry[17];
  assign sum[18] = a[18] ^ b[18] ^ carry[18];
  assign sum[19] = a[19] ^ b[19] ^ carry[19];
  assign sum[20] = a[20] ^ b[20] ^ carry[20];
  assign sum[21] = a[21] ^ b[21] ^ carry[21];
  assign sum[22] = a[22] ^ b[22] ^ carry[22];
  assign sum[23] = a[23] ^ b[23] ^ carry[23];
  assign sum[24] = a[24] ^ b[24] ^ carry[24];
  assign sum[25] = a[25] ^ b[25] ^ carry[25];
  assign sum[26] = a[26] ^ b[26] ^ carry[26];
  assign sum[27] = a[27] ^ b[27] ^ carry[27];
  assign sum[28] = a[28] ^ b[28] ^ carry[28];
  assign sum[29] = a[29] ^ b[29] ^ carry[29];
  assign sum[30] = a[30] ^ b[30] ^ carry[30];
  assign sum[31] = a[31] ^ b[31] ^ carry[31];



  // Calculate carry-out flag
  assign carry_out = (a[31] & b[31] & ~sum[31]) | (~a[31] & ~b[31] & sum[31]);

  // Calculate overflow flag
  assign overflow = carry[32];

  // Calculate zero flag
  assign zero = ((sum == 32'b0) & !overflow);
endmodule