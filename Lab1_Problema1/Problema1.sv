module Problema1(a,b,c,d,s1,s2);

	input wire a,b,c,d;
	output wire [6:0] s1,s2;

	reg[6:0] segments1, segments2;

	assign s1 = segments1;
	assign s2 = segments2;
	
	always @(a,b,c,d)
	begin
		case({a,b,c,d})
		// 0000 -> 0
		4'b0000: begin
			segments1 = 7'b1111111;
			segments2 = 7'b1000000;
		end
		
		// 0001 -> 1 
		4'b0001: begin
			segments1 = 7'b1111111;
			segments2 = 7'b1111001;
		end
		
		// 0010 -> 2
		4'b0010: begin
			segments1 = 7'b1111111;
			segments2 = 7'b0100100;
		end
		
		// 0011 -> 3 
		4'b0011: begin
			segments1 = 7'b1111111;
			segments2 = 7'b0110000;
		end
		
		// 0100 -> 4
		4'b0100: begin
			segments1 = 7'b1111111;
			segments2 = 7'b0011001;
		end
		
		// 0101 -> 5 
		4'b0101: begin
			segments1 = 7'b1111111;
			segments2 = 7'b0010010;
		end
		
		// 0110 -> 6
		4'b0110: begin
			segments1 = 7'b1111111;
			segments2 = 7'b0000010;
		end
		
		// 0111 -> 7 
		4'b0111: begin
			segments1 = 7'b1111111;
			segments2 = 7'b1111000;
		end
		
		// 1000 -> 8
		4'b1000: begin
			segments1 = 7'b1111111;
			segments2 = 7'b0000000;
		end
		
		// 1001 -> 9 
		4'b1001: begin
			segments1 = 7'b1111111;
			segments2 = 7'b0011000;
		end
		
		// 1010 -> 10
		4'b1010: begin
			segments1 = 7'b1111001;
			segments2 = 7'b1000000;
		end
		
		// 1011 -> 11 
		4'b1011: begin
			segments1 = 7'b1111001;
			segments2 = 7'b1111001;
		end
		
		// 1100 -> 12
		4'b1100: begin
			segments1 = 7'b1111001;
			segments2 = 7'b0100100;
		end
		
		// 1101 -> 13 
		4'b1101: begin
			segments1 = 7'b1111001;
			segments2 = 7'b0110000;
		end
		
		// 1110 -> 14
		4'b1110: begin
			segments1 = 7'b1111001;
			segments2 = 7'b0011001;
		end
		
		// 1111 -> 15
		4'b1111: begin
			segments1 = 7'b1111001;
			segments2 = 7'b0010010;
		end
		endcase
	end
endmodule
		
		
					

					
