
#!/bin/bash

# ===========================
# Optimized Build Script for Thesis
# ===========================

MAIN_TEX="main.tex"
PDF_FILE="${MAIN_TEX%.*}.pdf"

# ===========================
# Function: Check command exists
# ===========================
check_command() {
    if ! command -v "$1" &> /dev/null; then
        echo "$1 chưa được cài. Cài bằng: sudo apt install $1"
        exit 1
    fi
}

# ===========================
# Function: Check font exists
# ===========================
check_font() {
    if ! fc-list | grep -iq "$1"; then
        echo "Font '$1' không tồn tại trên hệ thống. Cài trước khi build."
        exit 1
    fi
}

# ===========================
# Check dependencies
# ===========================
check_command latexmk
check_command xelatex
check_command biber
check_command zathura

# ===========================
# Check fonts
# ===========================
# Ví dụ font cần thiết
check_font "Times New Roman"
check_font "Fira Code"

# ===========================
# Build PDF
# ===========================
echo "Bắt đầu build $MAIN_TEX ..."
latexmk -xelatex -interaction=nonstopmode -synctex=1 -shell-escape "$MAIN_TEX"

# Biber cho bibliography (nếu có)
biber "${MAIN_TEX%.*}" 2>/dev/null

# Chạy lại latexmk để hoàn tất cross-reference
latexmk -xelatex -interaction=nonstopmode -synctex=1 -shell-escape "$MAIN_TEX"

# ===========================
# Optional: Clean auxiliary files
# ===========================
# latexmk -c

# ===========================
# Open PDF
# ===========================
if [ -f "$PDF_FILE" ]; then
    echo "Build xong: $PDF_FILE"
    zathura "$PDF_FILE" &
else
    echo "PDF không được tạo. Kiểm tra lỗi LaTeX."
    exit 1
fi
