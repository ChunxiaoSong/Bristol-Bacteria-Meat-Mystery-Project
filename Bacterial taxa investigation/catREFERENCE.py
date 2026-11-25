# This script is used to combine all of the 20 reference sequences into a fasta file.
# Combine all TXT files containing FASTA sequences into one FASTA file.

from pathlib import Path


input_directory = Path(__file__).resolve().parent
output_file = input_directory / "all_reference_sequences.fasta"

# Select only the reference sequence TXT files.
input_files = sorted(input_directory.glob("* reference sequences.txt"))
record_count = 0

with output_file.open("w", encoding="utf-8", newline="\n") as destination:
    for input_file in input_files:
        with input_file.open("r", encoding="utf-8") as source:
            content = source.read().strip()

        if not content:
            continue

        destination.write(content)
        destination.write("\n")
        record_count += content.count("\n>")

        # Count the first record too.
        if content.startswith(">"):
            record_count += 1

print(
    f"Combined {len(input_files)} TXT files into "
    f"{output_file} ({record_count} FASTA records)"
)
