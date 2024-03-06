module alu_32bit(
    input logic [31:0] a,
    input logic [31:0] b,
    input logic [31:0] op,
    input logic start,
    output logic [63:0] result
);
    wire [31:0] div_result, and_result, or_result, xor_result, left_result, right_result;
	 wire [32:0] add_result;
    wire [32:0] sub_result;
	 wire [63:0] mul_result;

    adder_32bit adder (a, b, add_result[32:0], add_CFlag, add_VFlag, add_ZFlag);
    subtractor_32bit subtractor (a, b, sub_result[32:0], sub_CFlag, sub_VFlag, sub_ZFlag, sub_NFlag);
    multiplier_32bit multiplier (a, b, mul_result[63:0], mul_VFlag, mul_ZFlag);
	 divider_32bit divider (a, b, div_result[31:0], div_VFlag, div_ZFlag);
	 and_32bit andd (a,b, and_result[31:0], and_ZFlag);
	 or_32bit orr (a,b, or_result[31:0], or_ZFlag);
	 xor_32bit xorr (a,b, xor_result[31:0], xor_ZFlag);
	 shiftLeft_32bit left (a,left_result[31:0], left_ZFlag, left_CFlag);
	 shiftRight_32bit right (a,right_result[31:0], right_ZFlag, right_CFlag);


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
        result = 4'b0000;

    end
end
endmodule