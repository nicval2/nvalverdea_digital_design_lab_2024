module alu_4bit_tb;

  // Define parameters
  parameter PERIOD = 10;

  // Declare signals
  logic [3:0] a, b;
  logic [2:0] op;
  logic [3:0] out;

  // Instantiate the ALU module
  alu_4bit alu_inst (
    .a(a),
    .b(b),
    .op(op),
    .out(out)
  );


  // Test stimulus
  initial begin
    // Test case 1: Addition
    a = 4'b0110;
    b = 4'b0011;
    op = 3'b000; // Add
    #40;
    
    // Test case 2: Subtraction
    a = 4'b0110;
    b = 4'b0011;
    op = 3'b001; // Subtract
    #40;
    
    // Test case 3: Addition
    a = 4'b1100;
    b = 4'b0101;
    op = 3'b000; // Add
    #40;
    
    // Test case 4: Subtraction
    a = 4'b1100;
    b = 4'b0101;
    op = 3'b001; // Subtract
    #40;
	 
	 // Test case 5: Addition
    a = 4'b1111;
    b = 4'b1111;
    op = 3'b000; // Add
    #40;
    
    
    // End simulation
    $finish;
  end

endmodule
