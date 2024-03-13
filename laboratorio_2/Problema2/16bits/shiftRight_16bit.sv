module shiftRight_16bit(
  input logic [15:0] a,
  output logic [15:0] result,
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
  assign result[15] = 1'b0;

  // Set zero flag
  assign zero_flag = (result == 16'b0000000000000000);

  // Set carry flag based on the value of the MSB of input 'a'
  assign carry_flag = (a[0] == 1'b1);

endmodule