module alu_8bit(
    input logic [7:0] a,
    input logic [7:0] b,
    input logic [7:0] op,
    input logic start,
	 output logic [15:0] result

);
    wire [8:0] div_result, and_result, or_result, xor_result, left_result, right_result;
	 wire [9:0] add_result;
    wire [9:0] sub_result;
	 wire [15:0] mul_result;

    adder_8bit adder (a, b, add_result[9:0], add_CFlag, add_VFlag, add_ZFlag);
    subtractor_8bit subtractor (a, b, sub_result[9:0], sub_CFlag, sub_VFlag, sub_ZFlag, sub_NFlag);
    multiplier_8bit multiplier (a, b, mul_result[15:0], mul_VFlag, mul_ZFlag);
	 divider_8bit divider (a, b, div_result[8:0], div_VFlag, div_ZFlag);
	 and_8bit andd (a,b, and_result[8:0], and_ZFlag);
	 or_8bit orr (a,b, or_result[8:0], or_ZFlag);
	 xor_8bit xorr (a,b, xor_result[8:0], xor_ZFlag);
	 shiftLeft_8bit left (a,left_result[8:0], left_ZFlag, left_CFlag);
	 shiftRight_8bit right (a,right_result[8:0], right_ZFlag, right_CFlag);
	 
	 DigitExtractor extractor(.input_number(result), .digit_1(digit_1), .digit_2(digit_2));
    segmentOutput segment1(.digit(digit_1), .seg(s1));
    segmentOutput segment2(.digit(digit_2), .seg(s2));

always_comb begin
    if (start) begin
        case (op)
            4'b0001: result <= add_result[2] ? add_result[2:0] : {1'b0, add_result[1:0]}; // Zero-extend add_result to 8 bits only if it's 4 bits
            4'b0010: result <= {2'b0, sub_result[1:0]}; 
            4'b0011: result <= mul_result;
				4'b0100: result <= div_result;
            4'b0101: result <= and_result; 
            4'b0111: result <= or_result;
				4'b1000: result <= xor_result;
            4'b1001: result <= left_result; 
            4'b1011: result <= right_result;
            default: result <= 4'b0000;
        endcase
    end else begin
        result = 16'b0000000000000000;

    end
end
endmodule