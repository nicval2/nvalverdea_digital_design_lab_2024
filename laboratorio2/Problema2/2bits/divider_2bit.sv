module divider_2bit(
  input logic [1:0] dividend,
  input logic [1:0] divisor,
  output logic [1:0] quotient,
  output logic overflow,
  output logic zero
  
);

   always_comb begin

		quotient= dividend/divisor;

	end 

endmodule