module segmentOutput(input [3:0] digit,
    output [6:0] seg);

	reg[6:0] segments1;

	assign seg = segments1;
	
	always @(digit)
	begin
		case(digit)
		// 0000 -> 0
		4'b0000:segments1 = 7'b1000000;
		
		// 0001 -> 1 
		4'b0001: segments1 = 7'b1111001;
		
		// 0010 -> 2
		4'b0010: segments1 = 7'b0100100;
		
		// 0011 -> 3 
		4'b0011: segments1 = 7'b0110000;
		
		// 0100 -> 4
		4'b0100: segments1 = 7'b0011001;
		
		// 0101 -> 5 
		4'b0101: segments1 = 7'b0010010;
		
		// 0110 -> 6
		4'b0110: segments1 = 7'b0000010;
		
		// 0111 -> 7 
		4'b0111: segments1 = 7'b1111000;
	
		// 1000 -> 8
		4'b1000: segments1 = 7'b0000000;
		
		// 1001 -> 9 
		4'b1001: segments1 = 7'b0011000;
		
		endcase
	end
endmodule