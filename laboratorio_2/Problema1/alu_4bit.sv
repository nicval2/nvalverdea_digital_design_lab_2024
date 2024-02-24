module alu_4bit(
  input logic [3:0] a,
  input logic [3:0] b,
  input logic [2:0] op,
  output logic [4:0] out
);

  wire [4:0] add;
  wire [4:0] sub;

  // Instantiate arithmetic modules
  adder_4bit adder_inst(a, b, add[4:0]);
  subtractor_4bit subtractor_inst(a, b, sub[4:0]);

  always_comb begin
    case(op)
      3'b000: out = add; // add
      3'b001: out = sub; // subtract
      //3'b010: out = a & b;    // bitwise AND
      //3'b011: out = a | b;    // bitwise OR
      //3'b100: out = a ^ b;    // bitwise XOR
      //3'b101: out = ~a;       // bitwise NOT of a
      //3'b110: out = ~b;       // bitwise NOT of b
      //3'b111: out = 4'b0;     // clear output
      default: out = 4'b0;    // clear output for undefined op
    endcase
  end

endmodule
