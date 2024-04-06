#ver3 - 'working!'
#!/bin/bash

check_word() {
	local regex include exclude unknown word="$1" colors="$2"

	for i in {0..4}; do
		char=${word:i:1}
		char_color=${colors:i:1}
		case ${char_color,} in
			g) pattern+="[${char^}${char,}]";;
			y)
				include+="[${char^}${char,}].*"
				pattern+="[^${char^}${char,}]"
				;;
			*)
				pattern+="."
				exclude+="${char^}${char,}"
				;;
		esac
	done

	#[[ $include ]] && include="[$include]"
	[[ $exclude ]] && exclude="[$exclude]"
	awk '!/'"${exclude:-#}"'/ && /'"$include"'/ && /^'"$pattern"'$/' ./words.txt
}

# Ask the user to enter a five-letter word
read -p "Enter a five-letter word: " input_word

# Validate the entered word length
if [ ${#input_word} -ne 5 ]; then
    echo "Error: Word must be exactly 5 letters long."
    exit 1
fi

# Ask the user to enter the colors
read -p "Enter the colors ('s' for gray, 'y' for yellow, 'g' for green): " input_colors

# Validate the colors string
if ! [[ $input_colors =~ ^[sygSYG]{5}$ ]]; then
    echo "Error: The colors string must contain exactly 5 characters: 's', 'y', or 'g'."
    exit 1
fi

# Convert the input word and colors to lowercase
input_word=$(echo "$input_word" | tr '[:upper:]' '[:lower:]')
input_colors=$(echo "$input_colors" | tr '[:upper:]' '[:lower:]')

# Call the check_word function with the input word and colors
check_word "$input_word" "$input_colors"

