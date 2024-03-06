module divider_32bit(
  input logic [31:0] dividend,
  input logic [31:0] divisor,
  output logic [31:0] quotient,
  output logic overflow,
  output logic zero
  
);

   always_comb begin

		quotient= dividend/divisor;

	end 

endmodule