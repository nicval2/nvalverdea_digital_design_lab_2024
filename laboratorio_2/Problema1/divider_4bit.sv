module divider_4bit(
    input logic [3:0] dividend,
    input logic [3:0] divisor,
    output logic [3:0] quotient
);

    always_comb begin

		quotient= dividend/divisor;

	end 
endmodule
