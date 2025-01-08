#!/bin/bash

# Loop through all `*.annotated.todo` files in the `output` directory.
for file in ./*.annotated.todo; do
    # Make a backup of the file with the .bak suffix.
    cp "$file" "$file.bak"

    # Counter for occurrences of exactly 20-spaces padded 'Some' or 'None'.
    count=0

    # Process each line of the file.
    while IFS= read -r line; do
        # Check if the line contains exactly 20 spaces followed by 'Some'.
        if [[ $line =~ ^[[:space:]]{20}Some\( ]]; then
            # Replace the occurrence of 'Some' on that line with itself and the current count in square brackets.
            line="${line/Some\(/Some\( [$count]}"
            # Increment the counter.
            ((count++))
        fi
        # Check if the line contains exactly 20 spaces followed by 'None'.
        if [[ $line =~ ^[[:space:]]{20}None, ]]; then
            # Replace the occurrence of 'None' on that line with itself and the current count in square brackets.
            line="${line/None,/None, [$count]}"
            # Increment the counter.
            ((count++))
        fi
        # Output the modified (or unmodified) line.
        echo "$line"
    done < "$file" > "$file.tmp"

    # Replace the original file with the modified version.
    mv "$file.tmp" "$file"
done

