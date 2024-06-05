module segmentOutput(input [1:0] digit,
    output [6:0] seg);

	reg[6:0] segments1;

	assign seg = segments1;
	
	always @(digit)
	begin
		case(digit)
		// 00 -> 0
		2'b00:segments1 = 7'b1000000;
		
		// 01 -> 1 
		2'b01: segments1 = 7'b1111001;
		
		// 10 -> 2
		2'b10: segments1 = 7'b0100100;
		
		// 11 -> 3 
		2'b11: segments1 = 7'b0110000;
		
		endcase
	end
endmodule