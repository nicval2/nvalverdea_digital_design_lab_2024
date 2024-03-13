module DigitExtractor (
    input [3:0] input_number,
    output reg [3:0] digit_1,
    output reg [3:0] digit_2
);

    integer decimal_number;
    integer digit_1_decimal;
    integer digit_2_decimal;

    // Function to return binary value of a digit
    function [3:0] get_binary;
        input integer digit;
        case (digit)
            0: get_binary = 4'b0000;
            1: get_binary = 4'b0001;
            2: get_binary = 4'b0010;
            3: get_binary = 4'b0011;
            4: get_binary = 4'b0100;
            5: get_binary = 4'b0101;
            6: get_binary = 4'b0110;
            7: get_binary = 4'b0111;
            8: get_binary = 4'b1000;
            9: get_binary = 4'b1001;
            default: get_binary = 4'b0000;
        endcase
    endfunction

    // Calculate decimal_number based on input_number
    always_comb begin
        decimal_number = 0;
        for (integer i = 0; i < 4; i = i + 1) begin
            decimal_number = decimal_number + input_number[i] * (1 << i);
        end

        // Separate the digits
        digit_1_decimal = (decimal_number / 10) % 10;
        digit_2_decimal = decimal_number % 10;
    end

    // Convert each digit to its 4-bit binary form
    always_comb begin
        digit_1 = get_binary(digit_1_decimal);
        digit_2 = get_binary(digit_2_decimal);
    end
endmodule
