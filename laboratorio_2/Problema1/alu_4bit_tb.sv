module alu_4bit_tb;

  // Declare signals
  logic [3:0] a, b;
  logic [1:0] op;
  logic [7:0] result;
  
  // Instantiate the DUT
  alu_4bit dut (
    .a(a),
    .b(b),
    .op(op),
    .result(result)
  );


  // Test stimulus
  initial begin
    // Test case 1: Addition
    a = 4'b0110; // 6
    b = 4'b0011; // 3
    op = 2'b00; // Add
					// 9 = 1001
    #40;
	 
	 // Test case 2: Addition
    a = 4'b1100; // 12
    b = 4'b0101; // 5
    op = 2'b00; // Add
					// 17 = 10001
    #40;
	 
	 // Test case 3: Subtraction
    a = 4'b0110; // 6
    b = 4'b0011; // 3
    op = 2'b01; // Subtract
					// 3 = 11
    #40;
	 
	 // Test case 4: Subtraction
    a = 4'b1100; // 12
    b = 4'b0101; // 5
    op = 2'b01; // Subtract
	 				// 7 = 111
    #40;
	 
	 // Test case 5: Multiplier
    a = 4'b0110; // 6
    b = 4'b0011; // 3
    op = 2'b10; // Multiply
					// 18 = 10010
    #40;
	 
	 // Test case 6: Multiplier
    a = 4'b1100; // 12
    b = 4'b0101; // 5
    op = 2'b10; // Multiply
	 				// 60 = 111100
    #40;
 
  end

endmodule
