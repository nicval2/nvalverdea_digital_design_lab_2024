module alu_4bit_tb;

  // Declare signals
  logic [3:0] a, b;
  logic [3:0] op;
  logic start;
  logic [6:0] s1, s2;
  logic NFlag, ZFlag, CFlag, VFlag;
  
  // Instantiate the DUT
  alu_4bit dut (
    .a(a),
    .b(b),
    .op(op),
    .start(start),
    .s1(s1),
    .s2(s2),
    .NFlag(NFlag),
    .ZFlag(ZFlag),
    .CFlag(CFlag),
    .VFlag(VFlag)
  );


  // Test stimulus
  initial begin
    // Test case 1.1: Addition
    start = 1;
    a = 4'b0110; // 6
    b = 4'b0011; // 3
    op = 4'b0000; // Add
    #100; // Wait for computation
	 assert(s1 === 7'b1000000) else $error("Test case 1.1 failed: Expected s1 to be 1000000");
    assert(s2 === 7'b0011000) else $error("Test case 1.1 failed: Expected s2 to be 0011000");
    assert(NFlag === 1'b0) else $error("Test case 1.1 failed: Expected NFlag to be 0");
    assert(ZFlag === 1'b0) else $error("Test case 1.1 failed: Expected ZFlag to be 0");
    assert(CFlag === 1'b1) else $error("Test case 1.1 failed: Expected CFlag to be 1");
    assert(VFlag === 1'b0) else $error("Test case 1.1 failed: Expected VFlag to be 0");
	 
	 // Test case 1.2: Addition
    start = 1;
    a = 4'b1010; // 10
    b = 4'b1011; // 11
    op = 4'b0000; // Add
    #100; // Wait for computation
	 assert(s1 === 7'b1000000) else $error("Test case 1.2 failed: Expected s1 to be 1000000");
    assert(s2 === 7'b0010010) else $error("Test case 1.2 failed: Expected s2 to be 0011000");
    assert(NFlag === 1'b0) else $error("Test case 1.2 failed: Expected NFlag to be 0");
    assert(ZFlag === 1'b0) else $error("Test case 1.2 failed: Expected ZFlag to be 0");
    assert(CFlag === 1'b1) else $error("Test case 1.2 failed: Expected CFlag to be 1");
    assert(VFlag === 1'b1) else $error("Test case 1.2 failed: Expected VFlag to be 1");
	 
    // Test case 2.1: Subtraction
    start = 1;
    a = 4'b0110; // 6
    b = 4'b0011; // 3
    op = 4'b0001; // Subtract
    #100; // Wait for computation
    assert(s1 === 7'b1000000) else $error("Test case 2.1 failed: Expected s1 to be 1000000");
    assert(s2 === 7'b0110000) else $error("Test case 2.1 failed: Expected s2 to be 0110000");
    assert(NFlag === 1'b0) else $error("Test case 2.1 failed: Expected NFlag to be 0");
    assert(ZFlag === 1'b0) else $error("Test case 2.1 failed: Expected ZFlag to be 0");
    assert(CFlag === 1'b0) else $error("Test case 2.1 failed: Expected CFlag to be 0");
    assert(VFlag === 1'b0) else $error("Test case 2.1 failed: Expected VFlag to be 0");
	 
	 // Test case 2.2: Subtraction
    start = 1;
    a = 4'b0011; // 3
    b = 4'b0110; // 6
    op = 4'b0001; // Subtract
    #100; // Wait for computation
    assert(s1 === 7'b1111001) else $error("Test case 2.2 failed: Expected s1 to be 1111001");
    assert(s2 === 7'b0110000) else $error("Test case 2.2 failed: Expected s2 to be 0110000");
    assert(NFlag === 1'b1) else $error("Test case 2.2 failed: Expected NFlag to be 1");
    assert(ZFlag === 1'b0) else $error("Test case 2.2 failed: Expected ZFlag to be 0");
    assert(CFlag === 1'b1) else $error("Test case 2.2 failed: Expected CFlag to be 1");
    assert(VFlag === 1'b0) else $error("Test case 2.2 failed: Expected VFlag to be 0");

    // Test case 3.1: Multiplication
    start = 1;
    a = 4'b0110; // 6
    b = 4'b0011; // 3
    op = 4'b0010; // Multiply
    #100; // Wait for computation
	 assert(s1 === 7'b1000000) else $error("Test case 3.1 failed: Expected s1 to be 1000000");
    assert(s2 === 7'b0100100) else $error("Test case 3.1 failed: Expected s2 to be 0100100");
    assert(NFlag === 1'b0) else $error("Test case 3.1 failed: Expected NFlag to be 0");
    assert(ZFlag === 1'b0) else $error("Test case 3.1 failed: Expected ZFlag to be 0");
    assert(CFlag === 1'b0) else $error("Test case 3.1 failed: Expected CFlag to be 0");
    assert(VFlag === 1'b1) else $error("Test case 3.1 failed: Expected VFlag to be 1");
	 
	 // Test case 3.2: Multiplication
    start = 1;
    a = 4'b0000; // 0
    b = 4'b0011; // 3
    op = 4'b0010; // Multiply
    #100; // Wait for computation
	 assert(s1 === 7'b1000000) else $error("Test case 3.2 failed: Expected s1 to be 1000000");
    assert(s2 === 7'b1000000) else $error("Test case 3.2 failed: Expected s2 to be 1000000");
    assert(NFlag === 1'b0) else $error("Test case 3.2 failed: Expected NFlag to be 0");
    assert(ZFlag === 1'b1) else $error("Test case 3.2 failed: Expected ZFlag to be 0");
    assert(CFlag === 1'b0) else $error("Test case 3.2 failed: Expected CFlag to be 0");
    assert(VFlag === 1'b0) else $error("Test case 3.2 failed: Expected VFlag to be 1");
	 
	 // Test case 4.1: Division
    start = 1;
    a = 4'b0110; // 6
    b = 4'b0011; // 3
    op = 4'b0011; // divide
    #100; // Wait for computation
	 assert(s1 === 7'b1000000) else $error("Test case 4.1 failed: Expected s1 to be 1000000");
    assert(s2 === 7'b0100100) else $error("Test case 4.1 failed: Expected s2 to be 0100100");
    assert(NFlag === 1'b0) else $error("Test case 4.1 failed: Expected NFlag to be 0");
    assert(ZFlag === 1'b0) else $error("Test case 4.1 failed: Expected ZFlag to be 0");
    assert(CFlag === 1'b0) else $error("Test case 4.1 failed: Expected CFlag to be 0");
    assert(VFlag === 1'b0) else $error("Test case 4.1 failed: Expected VFlag to be 0");
	 
	 // Test case 4.2: Division
    start = 1;
    a = 4'b0000; // 0
    b = 4'b0011; // 3
    op = 4'b0011; // divide
    #100; // Wait for computation
	 assert(s1 === 7'b1000000) else $error("Test case 4.2 failed: Expected s1 to be 1000000");
    assert(s2 === 7'b1000000) else $error("Test case 4.2 failed: Expected s2 to be 1000000");
    assert(NFlag === 1'b0) else $error("Test case 4.2 failed: Expected NFlag to be 0");
    assert(ZFlag === 1'b1) else $error("Test case 4.2 failed: Expected ZFlag to be 1");
    assert(CFlag === 1'b0) else $error("Test case 4.2 failed: Expected CFlag to be 0");
    assert(VFlag === 1'b0) else $error("Test case 4.2 failed: Expected VFlag to be 0");
	 
	 // Test case 4.3: Division
    start = 1;
    a = 4'b1001; // 9
    b = 4'b0110; // 6
    op = 4'b0011; // divide
    #100; // Wait for computation
	 assert(s1 === 7'b1000000) else $error("Test case 4.3 failed: Expected s1 to be 1000000");
    assert(s2 === 7'b1111001) else $error("Test case 4.3 failed: Expected s2 to be 1111001");
    assert(NFlag === 1'b0) else $error("Test case 4.3 failed: Expected NFlag to be 0");
    assert(ZFlag === 1'b0) else $error("Test case 4.3 failed: Expected ZFlag to be 0");
    assert(CFlag === 1'b0) else $error("Test case 4.3 failed: Expected CFlag to be 0");
    assert(VFlag === 1'b1) else $error("Test case 4.3 failed: Expected VFlag to be 1");
	 
	 // Test case 5.1: AND
    start = 1;
    a = 4'b0110; // 6
    b = 4'b0011; // 3
    op = 4'b0100; // and
    #100; // Wait for computation
	 assert(s1 === 7'b1000000) else $error("Test case 5.1 failed: Expected s1 to be 1000000");
    assert(s2 === 7'b0100100) else $error("Test case 5.1 failed: Expected s2 to be 0100100");
    assert(NFlag === 1'b0) else $error("Test case 5.1 failed: Expected NFlag to be 0");
    assert(ZFlag === 1'b0) else $error("Test case 5.1 failed: Expected ZFlag to be 0");
    assert(CFlag === 1'b0) else $error("Test case 5.1 failed: Expected CFlag to be 0");
    assert(VFlag === 1'b0) else $error("Test case 5.1 failed: Expected VFlag to be 0");
	 
	 // Test case 5.2: AND
    start = 1;
    a = 4'b0100; // 4
    b = 4'b1011; // 11
    op = 4'b0100; // or
    #100; // Wait for computation
	 assert(s1 === 7'b1000000) else $error("Test case 5.2 failed: Expected s1 to be 1000000");
    assert(s2 === 7'b1000000) else $error("Test case 5.2 failed: Expected s2 to be 1000000");
    assert(NFlag === 1'b0) else $error("Test case 5.2 failed: Expected NFlag to be 0");
    assert(ZFlag === 1'b1) else $error("Test case 5.2 failed: Expected ZFlag to be 1");
    assert(CFlag === 1'b0) else $error("Test case 5.2 failed: Expected CFlag to be 0");
    assert(VFlag === 1'b0) else $error("Test case 5.2 failed: Expected VFlag to be 0");
	 
	 // Test case 6.1: OR
    start = 1;
    a = 4'b0110; // 6
    b = 4'b0011; // 3
    op = 4'b0101; // or
    #100; // Wait for computation
	 assert(s1 === 7'b1000000) else $error("Test case 6.1 failed: Expected s1 to be 1000000");
    assert(s2 === 7'b1111000) else $error("Test case 6.1 failed: Expected s2 to be 1111000");
    assert(NFlag === 1'b0) else $error("Test case 6.1 failed: Expected NFlag to be 0");
    assert(ZFlag === 1'b0) else $error("Test case 6.1 failed: Expected ZFlag to be 0");
    assert(CFlag === 1'b0) else $error("Test case 6.1 failed: Expected CFlag to be 0");
    assert(VFlag === 1'b0) else $error("Test case 6.1 failed: Expected VFlag to be 0");
	 
	 // Test case 6.2: OR
    start = 1;
    a = 4'b0100; // 4
    b = 4'b1011; // 11
    op = 4'b0101; // xor
    #100; // Wait for computation
	 assert(s1 === 7'b1111001) else $error("Test case 6.2 failed: Expected s1 to be 1111001");
    assert(s2 === 7'b0010010) else $error("Test case 6.2 failed: Expected s2 to be 0010010");
    assert(NFlag === 1'b0) else $error("Test case 6.2 failed: Expected NFlag to be 0");
    assert(ZFlag === 1'b0) else $error("Test case 6.2 failed: Expected ZFlag to be 0");
    assert(CFlag === 1'b0) else $error("Test case 6.2 failed: Expected CFlag to be 0");
    assert(VFlag === 1'b0) else $error("Test case 6.2 failed: Expected VFlag to be 0");

	 
	 // Test case 7.1: XOR
    start = 1;
    a = 4'b0110; // 6
    b = 4'b0011; // 3
    op = 4'b0110; // and
    #100; // Wait for computation
	 assert(s1 === 7'b1000000) else $error("Test case 7.1 failed: Expected s1 to be 1000000");
    assert(s2 === 7'b0010010) else $error("Test case 7.1 failed: Expected s2 to be 0010010");
    assert(NFlag === 1'b0) else $error("Test case 7.1 failed: Expected NFlag to be 0");
    assert(ZFlag === 1'b0) else $error("Test case 7.1 failed: Expected ZFlag to be 0");
    assert(CFlag === 1'b0) else $error("Test case 7.1 failed: Expected CFlag to be 0");
    assert(VFlag === 1'b0) else $error("Test case 7.1 failed: Expected VFlag to be 0");
	 
	 // Test case 7.2: XOR
    start = 1;
    a = 4'b1111; // 15
    b = 4'b1111; // 15
    op = 4'b0110; // xor
    #100; // Wait for computation
	 assert(s1 === 7'b1000000) else $error("Test case 7.2 failed: Expected s1 to be 1000000");
    assert(s2 === 7'b1000000) else $error("Test case 7.2 failed: Expected s2 to be 1000000");
    assert(NFlag === 1'b0) else $error("Test case 7.2 failed: Expected NFlag to be 0");
    assert(ZFlag === 1'b1) else $error("Test case 7.2 failed: Expected ZFlag to be 1");
    assert(CFlag === 1'b0) else $error("Test case 7.2 failed: Expected CFlag to be 0");
    assert(VFlag === 1'b0) else $error("Test case 7.2 failed: Expected VFlag to be 0");

	 $display("Test finished");

  end

endmodule
