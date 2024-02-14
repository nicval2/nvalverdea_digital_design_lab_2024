module Problema1(a,b,c,d,s1,s2);

	input wire a,b,c,d;
	output wire [6:0] s1,s2;

	reg[6:0] segments1;
	reg[6:0] segments2;

	assign s1 = segments1;
	assign s2 = segments2;
	
	always @(a,b,c,d)
	begin
		case({a,b,c,d})
		// 0000 -> 0
		4'b0000: segments1 = 7'b1111111;
		4'b0000: segments2 = 7'b1000000;
		
		// 0001 -> 1 
		4'b0001: segments1 = 7'b1111111;
		4'b0001: segments2 = 7'b0000110;
		
		// 0010 -> 2
		4'b0010: segments1 = 7'b1111111;
		4'b0010: segments2 = 7'b0100100;
		
		// 0011 -> 3 
		4'b0011: segments1 = 7'b1111111;
		4'b0011: segments2 = 7'b0110000;
		
		// 0100 -> 4
		4'b0100: segments1 = 7'b1111111;
		4'b0100: segments2 = 7'b0011001;
		
		// 0101 -> 5 
		4'b0101: segments1 = 7'b1111111;
		4'b0101: segments2 = 7'b0010010;
		
		// 0110 -> 6
		4'b0110: segments1 = 7'b1111111;
		4'b0110: segments2 = 7'b1000010;
		
		// 0111 -> 7 
		4'b0111: segments1 = 7'b1111111;
		4'b0111: segments2 = 7'b1111000;
		
		// 1000 -> 8
		4'b1000: segments1 = 7'b1111111;
		4'b1000: segments2 = 7'b0000000;
		
		// 1001 -> 9 
		4'b1001: segments1 = 7'b1111111;
		4'b1001: segments2 = 7'b0011000;
		
		// 1010 -> 10
		4'b1010: segments1 = 7'b0000110;
		4'b1010: segments2 = 7'b1000000;
		
		// 1011 -> 11 
		4'b1011: segments1 = 7'b0000110;
		4'b1011: segments2 = 7'b0000110;
		
		// 1100 -> 12
		4'b1100: segments1 = 7'b0000110;
		4'b1100: segments2 = 7'b0100100;
		
		// 1101 -> 13 
		4'b1101: segments1 = 7'b0000110;
		4'b1101: segments2 = 7'b0110000;
		
		// 1110 -> 14
		4'b1110: segments1 = 7'b0000110;
		4'b1110: segments2 = 7'b0011001;
		
		// 1111 -> 15
		4'b1111: segments1 = 7'b0000110;
		4'b1111: segments2 = 7'b0010010;
		endcase
	end
endmodule
		
		
					

					
