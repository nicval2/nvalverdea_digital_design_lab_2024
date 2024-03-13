module shiftLeft_2bit(
  input logic [1:0] a,
  output logic [1:0] result,
  output logic zero_flag,
  output logic carry_flag
);

	assign result[0] = 1'b0;
  assign result[1] = a[0];


  // Set zero flag
  assign zero_flag = (result == 2'b00);

  // Set carry flag based on the value of the MSB of input 'a'
  assign carry_flag = (a[1] == 1'b1);

endmodule