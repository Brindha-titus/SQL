#!/bin/bash

grep -i "Pathogenic" variant_summary.txt > pathogenic.txt
grep -i "GRCh38" pathogenic.txt > filtered_variants.txt

echo "Filtering complete."

