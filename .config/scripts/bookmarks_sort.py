import re
from collections import OrderedDict
import argparse
import os

# Parse command line arguments
parser = argparse.ArgumentParser(
    description="Extract and deduplicate URLs from a file."
)
parser.add_argument("input_file", help="Path to the input text file")
args = parser.parse_args()

# Read file content
with open(args.input_file, "r", encoding="utf-8") as f:
    raw_text = f.read()

# Extract all URLs
url_pattern = re.compile(r"https?://[^\s\]\)]+")
urls = url_pattern.findall(raw_text)

# Deduplicate while preserving order
unique_urls = list(OrderedDict.fromkeys(urls))

# Join into single string
cleaned_output = "\n".join(unique_urls)

# Define output path
output_path = os.path.expanduser("~/.local/share/snippets/bookmarks")

# Make sure the directory exists
os.makedirs(os.path.dirname(output_path), exist_ok=True)

# Write output
with open(output_path, "w", encoding="utf-8") as out_file:
    out_file.write(cleaned_output)

print(f"✅ Bookmarks saved to: {output_path}")
