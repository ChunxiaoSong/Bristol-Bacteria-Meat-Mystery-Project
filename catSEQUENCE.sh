#!/bin/bash

# Define output file
output="all_sequences.fasta"

# Remove old output file if it exists
rm -f "$output"

# Loop through all FASTA files
for file in sequences_by_outlet/outlet_*/*.fasta
do
  # Extract the header line
  # ^> means "lines that start with a >"".
  # Assign this to variable called 'header'
  header=$(grep '^>' "$file")

  # Extract the outlet name
  outlet=$(basename "$(dirname "$file")")

  # Add outlet name to each sequence header
  new_header=$(echo "$header" | sed "s/seq/${outlet}_seq/g")

  # extract sequence as a string
  # use grep -v to invert the selection
  # in other words select every line apart from the match.
  sequence=$(grep -v '^>' "$file" | tr -d '\n')

  # write header and sequence to output
  echo "$new_header" >> "$output"
  echo "$sequence"  >> "$output"
done


echo "All sequences combined into $output"
