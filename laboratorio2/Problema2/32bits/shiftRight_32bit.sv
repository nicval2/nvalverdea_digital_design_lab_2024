module shiftRight_32bit(
  input logic [31:0] a,
  output logic [31:0] result,
  output logic zero_flag,
  output logic carry_flag
);

	assign result[0] = a[1];
  assign result[1] = a[2];
  assign result[2] = a[3];
  assign result[3] = a[4];
  assign result[4] = a[5];
  assign result[5] = a[6];
  assign result[6] = a[7];
  assign result[7] = a[8];
  assign result[8] = a[9];
  assign result[9] = a[10];
  assign result[10] = a[11];
  assign result[11] = a[12];
  assign result[12] = a[13];
  assign result[13] = a[14];
  assign result[14] = a[15];
  assign result[15] = a[16];
  assign result[16] = a[17];
  assign result[17] = a[18];
  assign result[18] = a[19];
  assign result[19] = a[20];
  assign result[20] = a[21];
  assign result[21] = a[22];
  assign result[22] = a[23];
  assign result[23] = a[24];
  assign result[24] = a[25];
  assign result[25] = a[26];
  assign result[26] = a[27];
  assign result[27] = a[28];
  assign result[28] = a[29];
  assign result[29] = a[30];
  assign result[30] = a[31];
  assign result[31] = 1'b0;

  // Set zero flag
  assign zero_flag = (result == 32'b00000000000000000000000000000000);

  // Set carry flag based on the value of the MSB of input 'a'
  assign carry_flag = (a[0] == 1'b1);

endmodule