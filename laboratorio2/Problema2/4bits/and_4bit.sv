module and_4bit(
  input logic [3:0] a,
  input logic [3:0] b,
  output logic [3:0] result,
  output logic zero_flag
);

	assign result[0] = a[0] & b[0];
  assign result[1] = a[1] & b[1];
  assign result[2] = a[2] & b[2];
  assign result[3] = a[3] & b[3];

  // Set flags
  assign zero_flag = (result == 4'b0000);

endmodule