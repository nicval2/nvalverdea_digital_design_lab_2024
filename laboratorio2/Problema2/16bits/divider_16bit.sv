module divider_16bit(
  input logic [15:0] dividend,
  input logic [15:0] divisor,
  output logic [15:0] quotient,
  output logic overflow,
  output logic zero
  
);

   always_comb begin

		quotient= dividend/divisor;

	end 

endmodule