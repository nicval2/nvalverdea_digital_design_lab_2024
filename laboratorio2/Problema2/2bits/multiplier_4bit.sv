module multiplier_4bit(
  input logic [1:0] a,
  input logic [1:0] b,
  output logic [3:0] out
);
  logic [2:0] product;

  always_comb begin
    product = 8'b0; 

    
    for (int i = 0; i < 2; i++) begin
      if (b[i])
        product = product + (a << i);
    end

    out = product;
  end
endmodule
