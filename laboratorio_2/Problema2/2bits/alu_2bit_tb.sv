module alu_2bit_tb;

  // Declare signals
  logic [1:0] a, b;
  logic [3:0] op;
  logic start;
  logic [1:0] result;
  logic NFlag, ZFlag, CFlag, VFlag;

  
  // Instantiate the DUT
  alu_2bit dut (
    .a(a),
    .b(b),
    .op(op),
    .start(start),
    .result(result),
	 .NFlag(NFlag),
    .ZFlag(ZFlag),
    .CFlag(CFlag),
    .VFlag(VFlag)
  );

  // Test stimulus
  initial begin
	 
    // Test case 1: Addition
	 start = 1;
    a = 2'b11; // 3
    b = 2'b10; // 2
    op = 4'b0001; // Add
					// 5
	 #80; // Wait for computation
	 start = 0;
    #80; // Wait for completion
	 
    // Test case 2: Addition
	 start = 1;
	 #40;
    a = 2'b10; // 2
    b = 2'b01; // 1
    op = 4'b0001; // Add
					// 37
	 #80; // Wait for computation
	 start = 0;
    #80; // Wait for completion
	 
	 // Test case 3: Subtraction
	 start = 1;
	 #40;
    a = 2'b11; // 3
    b = 2'b10; // 2
    op = 4'b0010; // Substract
					// 1
	 #80; // Wait for computation
	 start = 0;
    #80; // Wait for completion
	 
	 // Test case 4: Subtraction
	 start = 1;
	 #40;
    a = 2'b10; // 2
    b = 2'b01; // 1
    op = 4'b0010; // Substract
					// 1
	 #80; // Wait for computation
	 start = 0;
    #80; // Wait for completion
	 
	 // Test case 5: Multiplier
	 start = 1;
	 #40;
    a = 2'b11; // 3
    b = 2'b10; // 2
    op = 4'b0011; // Multiply
					// 6
	 #80; // Wait for computation
	 start = 0;
    #80; // Wait for completion
	 
	 // Test case 6: Multiplier
	 start = 1;
	 #40;
    a = 2'b10; // 2
    b = 2'b01; // 1
    op = 4'b0011; // Multiply
					// 2
	 #80; // Wait for computation
	 start = 0;
	 #80; // Wait for completion
	 
	 
	 // Test case 7: Division
	 start = 1;
	 #40;
    a = 2'b11; // 3
    b = 2'b10; // 2
    op = 4'b0011; // Divide
					// 1
	 #80; // Wait for computation
	 start = 0;
    #80; // Wait for completion
	 
	 // Test case 8: Division
	 start = 1;
	 #40;
    a = 2'b10; // 2
    b = 2'b01; // 1
    op = 4'b0011; // Divide
					// 1
	 #80; // Wait for computation
	 start = 0;
	 #80; // Wait for completion
	 
	 // Test case 9: AND
	 start = 1;
	 #40;
    a = 2'b11; // 3
    b = 2'b10; // 2
    op = 4'b0101; // AND
					// 
	 #80; // Wait for computation
	 start = 0;
    #80; // Wait for completion
	 
	 // Test case 10: AND
	 start = 1;
	 #40;
    a = 2'b10; // 2
    b = 2'b01; // 1
    op = 4'b0101; // AND
					// 
	 #80; // Wait for computation
	 start = 0;
	 #80; // Wait for completion
	 
	 // Test case 11: OR
	 start = 1;
	 #40;
    a = 2'b11; // 3
    b = 2'b10; // 2
    op = 4'b0111; // OR
					// 10
	 #80; // Wait for computation
	 start = 0;
    #80; // Wait for completion
	 
	 // Test case 12: OR
	 start = 1;
	 #40;
    a = 2'b10; // 2
    b = 2'b01; // 1
    op = 4'b0111; // OR
					// 1
	 #80; // Wait for computation
	 start = 0;
	 #80; // Wait for completion
	 
	 // Test case 13: XOR
	 start = 1;
	 #40;
    a = 2'b11; // 3
    b = 2'b10; // 2
    op = 4'b1000; // XOR
					// 10
	 #80; // Wait for computation
	 start = 0;
    #80; // Wait for completion
	 
	 // Test case 14: XOR
	 start = 1;
	 #40;
    a = 2'b10; // 2
    b = 2'b01; // 1
    op = 4'b1000; // XOR
					// 1
	 #80; // Wait for computation
	 start = 0;
	 #80; // Wait for completion
	 
	 // Test case 15: LEFT
	 start = 1;
	 #40;
    a = 2'b11; // 3
    b = 2'b10; // 2
    op = 4'b1001; // LEFT
					// 10
	 #80; // Wait for computation
	 start = 0;
    #80; // Wait for completion
	 
	 // Test case 16: LEFT
	 start = 1;
	 #40;
    a = 2'b10; // 2
    b = 2'b01; // 1
    op = 4'b1001; // LEFT
					// 1
	 #80; // Wait for computation
	 start = 0;
	 #80; // Wait for completion
	 
 	 // Test case 17: RIGHT
	 start = 1;
	 #40;
    a = 2'b11; // 3
    b = 2'b10; // 2
    op = 4'b1011; // RIGHT
					// 10
	 #80; // Wait for computation
	 start = 0;
    #80; // Wait for completion
	 
	 // Test case 18: RIGHT
	 start = 1;
	 #40;
    a = 2'b10; // 2
    b = 2'b01; // 1
    op = 4'b1011; // RIGHT
					// 1
	 #80; // Wait for computation
	 start = 0;
	 #80; // Wait for completion
 
  end

endmodule