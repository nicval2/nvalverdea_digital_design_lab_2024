module alu_4bit_tb;

  // Declare signals
  logic [3:0] a, b;
  logic [1:0] op;
  logic start;
  logic [6:0] s1,s2,s3;
  
  // Instantiate the DUT
  alu_4bit dut (
    .a(a),
    .b(b),
    .op(op),
    .start(start),
	 .s1(s1),
	 .s2(s2),
	 .s3(s3)
  );


  // Test stimulus
  initial begin
	 
    // Test case 1: Addition
	 start = 0;
	 #40;
    a = 4'b0110; // 6
    b = 4'b0011; // 3
    op = 2'b00; // Add
					// 9
	 #80; // Wait for computation
	 start = 1;
    #80; // Wait for completion
	 
    // Test case 2: Addition
	 start = 0;
	 #40;
    a = 4'b1100; // 12
    b = 4'b0101; // 5
    op = 2'b00; // Add
					// 17
	 #80; // Wait for computation
	 start = 1;
    #80; // Wait for completion
	 
	 // Test case 3: Subtraction
	 start = 0;
	 #40;
    a = 4'b0110; // 6
    b = 4'b0011; // 3
    op = 2'b01; // Subtract
					// 3
	 #80; // Wait for computation
	 start = 1;
    #80; // Wait for completion
	 
	 // Test case 4: Subtraction
	 start = 0;
	 #40;
    a = 4'b1100; // 12
    b = 4'b1000; // 8
    op = 2'b01; // Subtract
					// 4
	 #80; // Wait for computation
	 start = 1;
    #80; // Wait for completion
	 
	 // Test case 5: Multiplier
	 start = 0;
	 #40;
    a = 4'b0110; // 6
    b = 4'b0011; // 3
    op = 2'b10; // Multiply
					// 18
	 #80; // Wait for computation
	 start = 1;
    #80; // Wait for completion
	 
	 // Test case 6: Multiplier
	 start = 0;
	 #40;
    a = 4'b1111; // 15
    b = 4'b1111; // 15
    op = 2'b10; // Multiply
					// 225
	 #80; // Wait for computation
	 start = 1;
	 #80; // Wait for completion
 
  end

endmodule
