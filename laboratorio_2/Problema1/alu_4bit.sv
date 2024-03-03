module alu_4bit(
    input logic [3:0] a,
    input logic [3:0] b,
    input logic [3:0] op,
    input logic start,
    output logic [6:0] s1,
    output logic [6:0] s2,
	 output logic NFlag,
    output logic ZFlag,
    output logic CFlag,
	 output logic VFlag
);
    logic [3:0] result;
	 logic add_CFlag, add_VFlag, add_ZFlag;
	 logic sub_CFlag, sub_VFlag, sub_ZFlag, sub_NFlag;
	 logic mul_VFlag, mul_ZFlag;
	 logic div_VFlag, div_ZFlag;
	 logic and_ZFlag, or_ZFlag;
    wire [3:0] add_result, sub_result, mul_result, div_result, and_result, or_result;
	 
    wire [3:0] digit_1, digit_2;

    adder_4bit adder (a, b, add_result, add_CFlag, add_VFlag, add_ZFlag);
    subtractor_4bit subtractor (a, b, sub_result, sub_CFlag, sub_VFlag, sub_ZFlag, sub_NFlag);
    multiplier_4bit multiplier (a, b, mul_result, mul_VFlag, mul_ZFlag);
	 divider_4bit divider (a, b, div_result, div_VFlag, div_ZFlag);
	 and_4bit andd (a,b, and_result, and_ZFlag);
	 or_4bit orr (a,b, or_result, or_ZFlag);
	 
	 DigitExtractor extractor(.input_number(result), .digit_1(digit_1), .digit_2(digit_2));
    segmentOutput segment1(.digit(digit_1), .seg(s1));
    segmentOutput segment2(.digit(digit_2), .seg(s2));

always_comb begin
    if (start) begin
        case (op)
            4'b0000: begin
                result = add_result;
                NFlag = 1'b0;
                ZFlag = add_ZFlag;
                CFlag = add_CFlag;
                VFlag = add_VFlag;
            end
            4'b0001: begin
                result = sub_result;
                NFlag = sub_NFlag;
                ZFlag = sub_ZFlag;
                CFlag = sub_CFlag;
                VFlag = sub_VFlag;
            end
            4'b0010: begin
                result = mul_result;
                NFlag = 1'b0;
                ZFlag = mul_ZFlag;
                CFlag = 1'b0;
                VFlag = mul_VFlag;
            end
				4'b0011: begin
                result = div_result;
                NFlag = 1'b0;
                ZFlag = div_ZFlag;
                CFlag = 1'b0;
                VFlag = div_VFlag;
            end
				4'b00100: begin
                result = and_result;
                NFlag = 1'b0;
                ZFlag = and_ZFlag;
                CFlag = 1'b0;
                VFlag = 1'b0;
            end
				4'b00101: begin
                result = or_result;
                NFlag = 1'b0;
                ZFlag = or_ZFlag;
                CFlag = 1'b0;
                VFlag = 1'b0;
            end
            default: begin
                result = 4'b0000;
                NFlag = 1'b0;
                ZFlag = 1'b0;
                CFlag = 1'b0;
                VFlag = 1'b0;
            end
				
        endcase
    end else begin
        result = 4'b0000;
        NFlag = 1'b0;
        ZFlag = 1'b0;
        CFlag = 1'b0;
        VFlag = 1'b0;
    end
end
endmodule