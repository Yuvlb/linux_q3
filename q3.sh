#!/bin/bash

# Ask the user to enter a five-letter word
read -p "Enter a five-letter word: " input_word
# Validate the entered word length
if [ ${#input_word} -ne 5 ]; then
    echo "Error: Word must be exactly 5 letters long."
    exit 1
fi

# Ask the user to enter the colors
read -p "Enter the colors ('s' for gray, 'y' for yellow, 'g' for green): " input_colors

# Convert the input word and colors to lowercase
input_word=$(echo "$input_word" | tr '[:upper:]' '[:lower:]')
input_colors=$(echo "$input_colors" | tr '[:upper:]' '[:lower:]')

check_word() {
    local regex include exclude unknown word="$1" colors="$2"
    # Function body will be implemented later
}


