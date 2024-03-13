module shiftLeft_4bit(
  input logic [3:0] a,
  output logic [3:0] result,
  output logic zero_flag,
  output logic carry_flag
);

	assign result[0] = 1'b0;
  assign result[1] = a[0];
  assign result[2] = a[1];
  assign result[3] = a[2];

  // Set zero flag
  assign zero_flag = (result == 4'b0000);

  // Set carry flag based on the value of the MSB of input 'a'
  assign carry_flag = (a[3] == 1'b1);

endmodule