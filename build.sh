
#!/bin/bash
# Xóa file tạm
rm -f *.aux *.log *.out *.toc *.bbl *.bcf *.blg *.run.xml *.nav *.snm *.synctex.gz

# Build LaTeX
xelatex -shell-escape -interaction=nonstopmode main.tex &
pid1=$!

biber main &
pid2=$!

# Chờ các tiến trình xong
wait $pid1
wait $pid2

# Build lại để cập nhật cross-ref
xelatex -shell-escape -interaction=nonstopmode main.tex
xelatex -shell-escape -interaction=nonstopmode main.tex

# Mở PDF
zathura main.pdf &
