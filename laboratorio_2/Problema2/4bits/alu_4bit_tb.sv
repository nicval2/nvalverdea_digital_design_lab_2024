module alu_4bit_tb;

  // Declare signals
  logic [3:0] a, b;
  logic [3:0] op;
  logic start;
  logic [3:0] result;
  logic NFlag, ZFlag, CFlag, VFlag;
  
  // Instantiate the DUT
  alu_4bit dut (
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
  
	start = 0;
	 #60
	 
    // Test case 1.1: Addition
    a = 4'b0110; // 6
    b = 4'b0011; // 3
    op = 4'b0001; // Add
	 start = 1;
    #60 // Wait for computation

	 start = 0;
	 #60
	 
	 // Test case 1.2: Addition
    a = 4'b1010; // 10
    b = 4'b1011; // 11
    op = 4'b0001; // Add
	 start = 1;
    #60 // Wait for computation

	 start = 0;
	 #60
	 
    // Test case 2.1: Subtraction
    a = 4'b0110; // 6
    b = 4'b0011; // 3
    op = 4'b0010; // Subtract
	 start = 1;
    #60 // Wait for computation
 
	 start = 0;
	 #60
	 
	 // Test case 2.2: Subtraction
    a = 4'b0011; // 3
    b = 4'b0110; // 6
    op = 4'b0010; // Subtract
	 start = 1;
    #60 // Wait for computation

	 start = 0;
	 #60
	 
	 // Test case 3.1: Multiplication
    a = 4'b0000; // 0
    b = 4'b0011; // 3
    op = 4'b0011; // Multiply
	 start = 1;
    #80 // Wait for computation

	 start = 0;
	 #80
	 
	 // Test case 3.2: Multiplication
    a = 4'b0110; // 6
    b = 4'b0110; // 6
    op = 4'b0011; // Multiply
	 start = 1;
    #80 // Wait for computation

	 start = 0;
	 #80

	 
	 // Test case 4.1: Division
    a = 4'b0110; // 6
    b = 4'b0011; // 3
    op = 4'b0100; // divide
	 start = 1;
    #80 // Wait for computation

	 start = 0;
	 #80
	 
	 // Test case 4.2: Division
    a = 4'b0000; // 0
    b = 4'b0011; // 3
    op = 4'b0100; // divide
	 start = 1;
    #80 // Wait for computation

	 start = 0;
	 #80
	 
	 
	 // Test case 5.1: AND
    a = 4'b0110; // 6
    b = 4'b0011; // 3
    op = 4'b0101; // and
	 start = 1;
    #60 // Wait for computation

	 start = 0;
	 #60
	 
	 // Test case 5.2: AND
    a = 4'b0100; // 4
    b = 4'b1011; // 11
    op = 4'b0101; // and
	 start = 1;
    #60 // Wait for computation

	 start = 0;
	 #60
	 
	 // Test case 6.1: OR
    a = 4'b0110; // 6
    b = 4'b0011; // 3
    op = 4'b0110; // or
	 start = 1;
    #60 // Wait for computation

	 start = 0;
	 #60
	 
	 // Test case 6.2: OR
    a = 4'b0100; // 4
    b = 4'b1011; // 11
    op = 4'b0110; // or
	 start = 1;
    #60 // Wait for computation

	 start = 0;
	 #60

	 
	 // Test case 7.1: XOR
    a = 4'b0110; // 6
    b = 4'b0011; // 3
    op = 4'b0111; // xor
	 start = 1;
    #60 // Wait for computation

	 start = 0;
	 #60
	 
	 // Test case 7.2: XOR
    a = 4'b1111; // 15
    b = 4'b1111; // 15
    op = 4'b0111; // xor
	 start = 1;
    #60 // Wait for computation

	 start = 0;
	 #60
	 
	 // Test case 8.1: SHIFTLEFT
    a = 4'b0110; // 6
    op = 4'b1000; // shift
	 start = 1;
    #60 // Wait for computation

	 start = 0;
	 #60
	 
	 // Test case 8.2: SHIFTLEFT
    a = 4'b1111; // 15
    op = 4'b1000; // shift
	 start = 1;
    #60 // Wait for computation

	 start = 0;
	 #60
	 
	 // Test case 9.1: SHIFTRIGHT
    a = 4'b0101; // 5
    op = 4'b1001; // shift
	 start = 1;
    #60 // Wait for computation

	 start = 0;
	 #60
	 
	 // Test case 9.2: SHIFTRIGHT
    a = 4'b1111; // 15
    op = 4'b1001; // shift
	 start = 1;
    #60 // Wait for computation

	 start = 0;
	 #60

	 $display("Test finished");

  end

endmodule