#!/bin/bash

# URL of the NAV data
url="https://www.amfiindia.com/spages/NAVAll.txt"

# Output TSV file
output="scheme_asset_value.tsv"

# Download and process the file
curl -s "$url" | awk -F ';' '
BEGIN {
    OFS="\t";  # Output Field Separator as Tab
    print "Scheme Name", "Asset Value"
}
NR > 1 && NF >= 5 && $4 ~ /^[0-9.]+$/ {
    print $3, $4
}' > "$output"

echo "Data extracted and saved to $output"
