module alu_16bit_tb;

  // Declare signals
  logic [15:0] a, b;
  logic [15:0] op;
  logic start;
  logic [31:0] result;
  
  // Instantiate the DUT
  alu_16bit dut (
    .a(a),
    .b(b),
    .op(op),
    .start(start),
    .result(result)
  );


 initial begin
	 
    // Test case 1: Addition
	 start = 1;
	 #40;
    a = 16'b1111101011110111; // 3
    b = 16'b1111101011110110; // 2
    op = 4'b0001; // Add
					// 5
	 #80; // Wait for computation
	 start = 0;
    #80; // Wait for completion
	 
    // Test case 2: Addition
	 start = 1;
	 #40;
    a = 16'b1111010111110110; // 2
    b = 16'b1111110101110101; // 1
    op = 4'b0001; // Add
					// 37
	 #80; // Wait for computation
	 start = 0;
    #80; // Wait for completion
	 
	 // Test case 3: Subtraction
	 start = 1;
	 #40;
    a = 16'b1110101111110111; // 3
    b = 16'b1110101111110110; // 2
    op = 4'b0010; // Substract
					// 1
	 #80; // Wait for computation
	 start = 0;
    #80; // Wait for completion
	 
	 // Test case 4: Subtraction
	 start = 1;
	 #40;
    a = 16'b1111011011101011; // 2
    b = 16'b1111010111101011; // 1
    op = 4'b0010; // Substract
					// 1
	 #80; // Wait for computation
	 start = 0;
    #80; // Wait for completion
	 
	 // Test case 5: Multiplier
	 start = 1;
	 #40;
    a = 16'b1111011110101111; // 3
    b = 16'b1111110101110110; // 2
    op = 4'b0011; // Multiply
					// 6
	 #80; // Wait for computation
	 start = 0;
    #80; // Wait for completion
	 
	 // Test case 6: Multiplier
	 start = 1;
	 #40;
    a = 16'b1111010111110110; // 2
    b = 16'b1111101011110101; // 1
    op = 4'b0011; // Multiply
					// 2
	 #80; // Wait for computation
	 start = 0;
	 #80; // Wait for completion
	 
	 
	 // Test case 7: Division
	 start = 1;
	 #40;
    a = 16'b1111110101110111; // 3
    b = 16'b1111111010110110; // 2
    op = 4'b0011; // Divide
					// 1
	 #80; // Wait for computation
	 start = 0;
    #80; // Wait for completion
	 
	 // Test case 8: Division
	 start = 1;
	 #40;
    a = 16'b1111111010110110; // 2
    b = 16'b1111010111110101; // 1
    op = 4'b0011; // Divide
					// 1
	 #80; // Wait for computation
	 start = 0;
	 #80; // Wait for completion
	 
	 // Test case 9: AND
	 start = 1;
	 #40;
    a = 16'b1111011101011111; // 3
    b = 16'b1110101111110110; // 2
    op = 4'b0101; // AND
					// 
	 #80; // Wait for computation
	 start = 0;
    #80; // Wait for completion
	 
	 // Test case 10: AND
	 start = 1;
	 #40;
    a = 16'b1111011110101110; // 2
    b = 16'b1111101011110101; // 1
    op = 4'b0101; // AND
					// 
	 #80; // Wait for computation
	 start = 0;
	 #80; // Wait for completion
	 
	 // Test case 11: OR
	 start = 1;
	 #40;
    a = 16'b1110101111101111; // 3
    b = 16'b1111010111110100; // 2
    op = 4'b0111; // OR
					// 10
	 #80; // Wait for computation
	 start = 0;
    #80; // Wait for completion
	 
	 // Test case 12: OR
	 start = 1;
	 #40;
    a = 16'b1111101011110110; // 2
    b = 16'b1111111010110101; // 1
    op = 4'b0111; // OR
					// 1
	 #80; // Wait for computation
	 start = 0;
	 #80; // Wait for completion
	 
	 // Test case 13: XOR
	 start = 1;
	 #40;
    a = 16'b1111110101110111; // 3
    b = 16'b1111010111110110; // 2
    op = 4'b1000; // XOR
					// 10
	 #80; // Wait for computation
	 start = 0;
    #80; // Wait for completion
	 
	 // Test case 14: XOR
	 start = 1;
	 #40;
    a = 16'b1111101011110110; // 2
    b = 16'b1111101011110101; // 1
    op = 4'b1000; // XOR
					// 1
	 #80; // Wait for computation
	 start = 0;
	 #80; // Wait for completion
	 
	 // Test case 15: LEFT
	 start = 1;
	 #40;
    a = 16'b1111101011110111; // 3
    b = 16'b1111110101110110; // 2
    op = 4'b1001; // LEFT
					// 10
	 #80; // Wait for computation
	 start = 0;
    #80; // Wait for completion
	 
	 // Test case 16: LEFT
	 start = 1;
	 #40;
    a = 16'b1111010111110110; // 2
    b = 16'b1111101011110101; // 1
    op = 4'b1001; // LEFT
					// 1
	 #80; // Wait for computation
	 start = 0;
	 #80; // Wait for completion
	 
 	 // Test case 17: RIGHT
	 start = 1;
	 #40;
    a = 16'b1111101011110111; // 3
    b = 16'b1111110101110110; // 2
    op = 4'b1011; // RIGHT
					// 10
	 #80; // Wait for computation
	 start = 0;
    #80; // Wait for completion
	 
	 // Test case 18: RIGHT
	 start = 1;
	 #40;
    a = 16'b1111101011110110; // 2
    b = 16'b1111110101110101; // 1
    op = 4'b1011; // RIGHT
					// 1
	 #80; // Wait for computation
	 start = 0;
	 #80; // Wait for completion
 
  end

endmodule
