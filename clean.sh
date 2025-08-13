#!/bin/bash

# Define the name of your main LaTeX file (without extension)
MAIN_FILE="main"

# Remove common auxiliary files
rm -f "$MAIN_FILE.aux" "$MAIN_FILE.bbl" "$MAIN_FILE.bcf" "$MAIN_FILE.blg" "$MAIN_FILE.lof" "$MAIN_FILE.log" "$MAIN_FILE.lot" "$MAIN_FILE.out" "$MAIN_FILE.toc" "$MAIN_FILE.run.xml"

# Remove other common LaTeX-generated files
rm -f *.spl *.synctex.gz *.fls *.fdb_latexmk
