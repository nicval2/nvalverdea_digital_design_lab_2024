module xor_2bit(
  input logic [1:0] a,
  input logic [1:0] b,
  output logic [1:0] result,
  output logic zero_flag
);

	assign result[0] = a[0] ^ b[0];
  assign result[1] = a[1] ^ b[1];


  // Set flags
  assign zero_flag = (result == 2'b00);

endmodule