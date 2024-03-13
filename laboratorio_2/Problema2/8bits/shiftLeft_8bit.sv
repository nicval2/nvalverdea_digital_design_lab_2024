module shiftLeft_8bit(
  input logic [7:0] a,
  output logic [7:0] result,
  output logic zero_flag,
  output logic carry_flag
);

	assign result[0] = 1'b0;
  assign result[1] = a[0];
  assign result[2] = a[1];
  assign result[3] = a[2];
  assign result[4] = a[3];
  assign result[5] = a[4];
  assign result[6] = a[5];
  assign result[7] = a[6];

  // Set zero flag
  assign zero_flag = (result == 8'b00000000);

  // Set carry flag based on the value of the MSB of input 'a'
  assign carry_flag = (a[7] == 1'b1);

endmodule