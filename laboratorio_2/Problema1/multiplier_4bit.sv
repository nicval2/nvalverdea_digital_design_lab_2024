module multiplier_4bit(
    input logic [3:0] a,
    input logic [3:0] b,
    output logic [3:0] out,
    output logic V,
    output logic Z
);

    logic [7:0] product;

    always_comb begin
        product = 8'b0;
        V = 1'b0; 
        Z = 1'b0; 

        for (int i = 0; i < 4; i++) begin
            if (b[i]) begin
                // Add the partial product directly to the main product
                product = product + (a << i);
            end
        end

        // Set Zero flag
        if (product == 8'b0)
            Z = 1'b1;

        // Check for Overflow
        if (product[7:4] != 4'b0)
            V = 1'b1;
				
        out = product[3:0];
    end
endmodule
