module and_8bit(
  input logic [7:0] a,
  input logic [7:0] b,
  output logic [7:0] result,
  output logic zero_flag
);

	assign result[0] = a[0] & b[0];
  assign result[1] = a[1] & b[1];
  assign result[2] = a[2] & b[2];
  assign result[3] = a[3] & b[3];
  assign result[4] = a[4] & b[4];
  assign result[5] = a[5] & b[5];
  assign result[6] = a[6] & b[6];
  assign result[7] = a[7] & b[7];


  // Set flags
  assign zero_flag = (result == 4'b0000);

endmodule