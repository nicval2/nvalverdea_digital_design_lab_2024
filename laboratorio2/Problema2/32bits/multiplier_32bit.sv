module multiplier_32bit(
    input logic [31:0] a,
    input logic [31:0] b,
    output logic [63:0] out,
    output logic V,
    output logic Z
);
	logic [7:0] product;


    always_comb begin
        product = 63'b0;

        for (int i = 0; i < 32; i++) begin
            if (b[i]) begin
                // Add the partial product directly to the main product
                product = product + (a << i);
            end
        end
	end


endmodule