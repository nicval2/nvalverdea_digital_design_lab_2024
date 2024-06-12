.text
.global _start

_start:
    LDR R2, =0x00  // Address where the replacement character is stored
    LDR R3, =0x01        // Address where the required vowel count is stored

    LDRB R5, [R2]               // Load the replacement character from memory
    LDRB R9, [R3]               // Load the required vowel count from memory

    LDR R0, =0x02      // Start address of the data
    LDR R1, =0x0FF    // End address of the data

    MOV R11, #0                 // Word counter

read_memory:
    CMP R0, R1                  // Compare the current address with the end address
    BGE end                     // If the current address is greater or equal, end

    LDRB R4, [R0]               // Load byte from memory
    CMP R4, #' '                // Check if the character is a space (word delimiter)
    BEQ skip_space              // If it is a space, skip to the next character

    MOV R6, #0                  // Reset vowel counter for the new word
    MOV R7, R0                  // Store the start address of the word

process_word:
    CMP R0, R1                  // Compare the current address with the end address
    BGE end                     // If the current address is greater or equal, end

    LDRB R4, [R0]               // Load byte from memory
    CMP R4, #' '                // Check if the character is a space (word delimiter)
    BEQ check_vowel_count       // If it is a space, check the vowel count

    // Check if the character is a vowel
    CMP R4, #'A'
    ADDEQ R6, R6, #1
    CMP R4, #'E'
    ADDEQ R6, R6, #1
    CMP R4, #'I'
    ADDEQ R6, R6, #1
    CMP R4, #'O'
    ADDEQ R6, R6, #1
    CMP R4, #'U'
    ADDEQ R6, R6, #1
    CMP R4, #'a'
    ADDEQ R6, R6, #1
    CMP R4, #'e'
    ADDEQ R6, R6, #1
    CMP R4, #'i'
    ADDEQ R6, R6, #1
    CMP R4, #'o'
    ADDEQ R6, R6, #1
    CMP R4, #'u'
    ADDEQ R6, R6, #1

    ADD R0, R0, #1              // Move to the next character
    B process_word

check_vowel_count:
    CMP R6, R9                  // Compare the vowel count with the required count
    BNE skip_replacement        // If not equal, skip the replacement

    MOV R0, R7                  // Reset the address to the start of the word

replace_vowels:
    CMP R0, R1                  // Compare the current address with the end address
    BGE end                     // If the current address is greater or equal, end

    LDRB R4, [R0]               // Load byte from memory
    CMP R4, #' '                // Check if the character is a space (word delimiter)
    BEQ skip_space              // If it is a space, skip to the next character

    // Check if the character is a vowel and replace it
    CMP R4, #'A'
    MOVEQ R4, R5
    CMP R4, #'E'
    MOVEQ R4, R5
    CMP R4, #'I'
    MOVEQ R4, R5
    CMP R4, #'O'
    MOVEQ R4, R5
    CMP R4, #'U'
    MOVEQ R4, R5
    CMP R4, #'a'
    MOVEQ R4, R5
    CMP R4, #'e'
    MOVEQ R4, R5
    CMP R4, #'i'
    MOVEQ R4, R5
    CMP R4, #'o'
    MOVEQ R4, R5
    CMP R4, #'u'
    MOVEQ R4, R5

    STRB R4, [R0]               // Store the modified byte back to memory
    ADD R0, R0, #1              // Move to the next character
    B replace_vowels

skip_replacement:
    ADD R11, R11, #1            // Increment word counter
    CMP R11, #150               // Check if the word count reaches 150
    BEQ end                     // If word count reaches 150, end

    ADD R0, R0, #1              // Move to the next character
    B read_memory

skip_space:
    ADD R11, R11, #1            // Increment word counter
    CMP R11, #150               // Check if the word count reaches 150
    BEQ end                     // If word count reaches 150, end

    ADD R0, R0, #1              // Move to the next character
    B read_memory

end:
    MOV R0, #0x18               // Exit code for simulation
    LDR R1, =0x20026            // Address to write the exit code (for simulation purposes)
    STR R0, [R1]

