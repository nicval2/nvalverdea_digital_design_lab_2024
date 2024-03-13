module multiplier_2bit(
    input logic [1:0] a,
    input logic [1:0] b,
    output logic [1:0] out,
    output logic V,
    output logic Z
);

    logic [3:0] product;

    always_comb begin
        product = 4'b0;

        for (int i = 0; i < 2; i++) begin
            if (b[i]) begin
                // Add the partial product directly to the main product
                product = product + (a << i);
            end
        end
	end
	  assign Z = (product == 4'b0);

        // Check for Overflow
		  assign V = (product[3:2] != 2'b0);
				
        assign out = product[1:0];
				
endmodule