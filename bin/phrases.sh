#!/usr/bin/bash
# File: ~/.dotfiles/bin/phrases.sh
# Last Change: Tue, 28 May 2024 - 09:21:13

# Pick up a random phrase from wiki phrases.md, display it, and copy it to the clipboard

# https://chatgpt.com/c/442ecf38-a001-4d6d-8f84-adb957e11d7f

file="$HOME/.dotfiles/wiki/phrases.md"

# Clear the screen
clear

# Title
echo "Random English phrase for you"
echo ""

# Read the file from line 10 onwards and split by two consecutive newlines
random_phrase=$(sed -n '10,$p' "$file" |\
awk -v RS='' '
BEGIN {
    srand();  # Seed the random number generator
}

{
    phrases[++count] = $0;  # Store each phrase in an array
}

END {
    if (count > 0) {
        random_index = int(rand() * count) + 1;  # Select a random index
        print phrases[random_index];  # Print the random phrase
    }
}
')

# Use tee to display the phrase with blank lines before and after, and copy it to the clipboard
echo ""
echo "$random_phrase" | tee /dev/tty | termux-clipboard-set
echo ""

