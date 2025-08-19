
#!/bin/bash
# ===========================
# Optimized LaTeX Build Script with Incremental Build
# ===========================

MAIN_TEX="main.tex"
PDF_FILE="${MAIN_TEX%.*}.pdf"

# ===========================
# Function: Clean auxiliary files
# ===========================
clean_aux() {
    echo "Cleaning auxiliary files..."
    rm -f *.aux *.log *.out *.toc *.bbl *.bcf *.blg \
          *.run.xml *.nav *.snm *.synctex.gz
}

# ===========================
# Function: Check dependencies
# ===========================
check_command() {
    if ! command -v "$1" &> /dev/null; then
        echo "$1 chưa được cài. Cài bằng: sudo apt install $1"
        exit 1
    fi
}

# ===========================
# Check required commands
# ===========================
check_command latexmk
check_command xelatex
check_command biber
check_command zathura

# ===========================
# Clean auxiliary files (optional)
# ===========================
# Uncomment the next line if you want a clean build every time
# clean_aux

# ===========================
# Build PDF using latexmk (incremental)
# ===========================
# -xelatex: dùng XeLaTeX
# -bibtex: chạy Biber nếu có bibliography
# -interaction=nonstopmode: in lỗi nhưng build tiếp
# -synctex=1: hỗ trợ SyncTeX
# -shell-escape: cho phép shell-escape
# -pdf: tạo PDF
# -quiet: in ít thông tin build không cần thiết, vẫn in lỗi
echo "Building $MAIN_TEX with latexmk..."
latexmk -xelatex -bibtex -interaction=nonstopmode -synctex=1 -shell-escape -pdf -quiet "$MAIN_TEX"

# ===========================
# Open PDF if build succeeded
# ===========================
if [ -f "$PDF_FILE" ]; then
    echo "Build completed: $PDF_FILE"
    zathura "$PDF_FILE" &
else
    echo "PDF không được tạo. Kiểm tra lỗi LaTeX."
    exit 1
fi
