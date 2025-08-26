
#!/bin/bash
# Compile LaTeX with XeLaTeX and Biber, safely continuing even if some steps fail

# Remove auxiliary files
echo "Cleaning auxiliary files..."
rm -f *.aux *.log *.out *.toc *.bbl *.bcf *.blg *.run.xml *.nav *.snm *.synctex.gz

# Helper function to run a command and continue even if it fails
run() {
    echo "Running: $*"
    "$@"
    if [ $? -ne 0 ]; then
        echo "Warning: Command failed: $*" >&2
    fi
}

# Compile steps
run xelatex --shell-escape main.tex
run biber main
run xelatex --shell-escape main.tex
run xelatex --shell-escape main.tex

# Open PDF
run zathura main.pdf
