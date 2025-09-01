#!/bin/bash

# Configurable paths (adjust as needed)
INPUT_FILE="$HOME/urls.txt"
OUTPUT_FILE="$HOME/bookmarks.html"

# Ensure the input file exists
if [ ! -f "$INPUT_FILE" ]; then
	echo "❌ Input file not found: $INPUT_FILE"
	exit 1
fi

# Start of the HTML structure
cat >"$OUTPUT_FILE" <<EOF
<!DOCTYPE NETSCAPE-Bookmark-file-1>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">
<TITLE>Bookmarks</TITLE>
<H1>Bookmarks</H1>
<DL><p>
    <DT><H3 PERSONAL_TOOLBAR_FOLDER="true">Imported Bookmarks</H3>
    <DL><p>
EOF

# Process each URL
while IFS= read -r url; do
	[ -z "$url" ] && continue # Skip empty lines

	domain=$(echo "$url" | sed -E 's_https?://([^/]+).*_\1_')
	echo "        <DT><A HREF=\"$url\">$domain</A>" >>"$OUTPUT_FILE"
done <"$INPUT_FILE"

# End of the HTML structure
cat >>"$OUTPUT_FILE" <<EOF
    </DL><p>
</DL><p>
EOF

echo "✅ Bookmarks file created: $OUTPUT_FILE"
