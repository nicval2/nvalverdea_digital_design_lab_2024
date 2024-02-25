module alu_4bit(
  input logic [3:0] a,
  input logic [3:0] b,
  input logic [1:0] op,
  output logic [7:0] result
);
  wire [4:0] add_result;
  wire [4:0] sub_result;
  wire [7:0] mul_result;

  adder_4bit adder (a, b, add_result[4:0]);
  subtractor_4bit subtractor (a, b, sub_result[4:0]);
  multiplier_4bit multiplier (a, b, mul_result[7:0]);

  always_comb begin
    case (op)
      2'b00: result = add_result[4] ? add_result : {4'b0, add_result[3:0]}; // Zero-extend add_result to 8 bits only if it's 4 bits
      2'b01: result = {4'b0, sub_result}; 
      2'b10: result = mul_result;
      default: result = 8'b00000000;
    endcase

  end
endmodule
