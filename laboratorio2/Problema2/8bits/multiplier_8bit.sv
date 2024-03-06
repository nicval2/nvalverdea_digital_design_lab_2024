module multiplier_8bit(
    input logic [7:0] a,
    input logic [7:0] b,
    output logic [15:0] out,
    output logic V,
    output logic Z
);

    logic [7:0] product;

    always_comb begin
        product = 8'b0;

        for (int i = 0; i < 4; i++) begin
            if (b[i]) begin
                // Add the partial product directly to the main product
                product = product + (a << i);
            end
        end
	end

        // Set Zero flag
		  assign Z = (product == 8'b0);

        // Check for Overflow
		  assign V = (product[7:4] != 4'b0);
				
        assign out = product[3:0];
endmodule