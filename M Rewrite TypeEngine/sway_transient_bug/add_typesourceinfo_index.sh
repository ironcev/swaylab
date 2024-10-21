#!/bin/bash

# Loop through all `.txt` files in the `output` directory.
for file in ./output/*.txt; do
    # Make a backup of the file with the .bak suffix.
    # cp "$file" "$file.bak"

    # Counter for occurrences of exactly 24-spaces padded 'TypeSourceInfo'.
    count=0

    # Process each line of the file
    while IFS= read -r line; do
        # Check if the line contains exactly 24 spaces followed by 'TypeSourceInfo'.
        if [[ $line =~ ^[[:space:]]{24}TypeSourceInfo ]]; then
            # Replace the first occurrence of 'TypeSourceInfo' on that line with itself and the current count in square brackets.
            line="${line/TypeSourceInfo/TypeSourceInfo [$count]}"
            # Increment the counter.
            ((count++))
        fi
        # Output the modified (or unmodified) line.
        echo "$line"
    done < "$file" > "$file.tmp"

    # Replace the original file with the modified version.
    mv "$file.tmp" "$file"
done

