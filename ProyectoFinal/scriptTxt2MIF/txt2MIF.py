def word_to_hex(word):
    """Convert a word to its hexadecimal representation and ensure it's 8 bits (4 characters)."""
    hex_representation = ''.join(format(ord(c), '02X') for c in word)
    return hex_representation[:8].ljust(8, '0')


def create_mif_content(words, width=32, depth=256):
    """Generate MIF content from a list of words."""
    mif_content = f"WIDTH={width};\nDEPTH={depth};\n\nADDRESS_RADIX=HEX;\nDATA_RADIX=HEX;\n\nCONTENT BEGIN\n"

    # Initialize all addresses to 0
    #mif_content += "\t[0..255]  :   0;\n"

    # Add special addresses for LDR instructions
    mif_content += f"\t0 : {word_to_hex('*')};\n"
    mif_content += f"\t1 : {format(2, '08X')};\n"

    # Add words to the MIF content
    for i, word in enumerate(words):
        if i + 2 >= depth:
            break
        hex_word = word_to_hex(word)
        mif_content += f"\t{i + 2:X} : {hex_word};\n"

    mif_content += "END;\n"
    return mif_content


def read_words_from_file(filename):
    """Read words from a text file and return a list of words."""
    with open(filename, 'r') as file:
        return file.read().split()


def replace_vowels(word, replacement_char, required_vowel_count):
    """Replace vowels in a word if the vowel count matches the required count."""
    vowels = "AEIOUaeiou"
    vowel_count = sum(1 for char in word if char in vowels)
    if vowel_count == required_vowel_count:
        return ''.join(replacement_char if char in vowels else char for char in word)
    return word


def create_final_memory_content(words, replacement_char='*', required_vowel_count=2):
    """Create the final memory content by replacing vowels in the words."""
    processed_words = [replace_vowels(word, replacement_char, required_vowel_count) for word in words]

    final_memory_content = "WIDTH=32;\nDEPTH=256;\n\nADDRESS_RADIX=HEX;\nDATA_RADIX=HEX;\n\nCONTENT BEGIN\n"
    #final_memory_content += "\t[0..255]  :   0;\n"

    final_memory_content += f"\t0 : {word_to_hex(replacement_char)};\n"
    final_memory_content += f"\t1 : {format(required_vowel_count, '08X')};\n"

    for i, word in enumerate(processed_words):
        if i + 2 >= 256:
            break
        hex_word = word_to_hex(word)
        final_memory_content += f"\t{i + 2:X} : {hex_word};\n"

    final_memory_content += "END;\n"
    return final_memory_content


def main():
    input_file = 'texto.txt'  # Change this to your input file name
    mif_output_file = 'data_memory.txt'
    final_memory_file = 'expected_output.txt'

    # Read words from input file
    words = read_words_from_file(input_file)

    # Create initial MIF content
    mif_content = create_mif_content(words)

    # Write initial MIF content to output file
    with open(mif_output_file, 'w') as file:
        file.write(mif_content)

    print(f"Initial MIF content generated and saved to {mif_output_file}")

    # Create final memory content
    final_memory_content = create_final_memory_content(words)

    # Write final memory content to a new file
    with open(final_memory_file, 'w') as file:
        file.write(final_memory_content)

    print(f"Final memory content generated and saved to {final_memory_file}")


if __name__ == "__main__":
    main()
