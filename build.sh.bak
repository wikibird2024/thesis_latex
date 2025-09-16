#!/bin/bash
rm -f *.aux *.log *.out *.toc *.bbl *.bcf *.blg *.run.xml *.nav *.snm *.synctex.gz
xelatex --shell-escape main.tex
biber main
xelatex --shell-escape main.tex
xelatex --shell-escape main.tex
zathura main.pdf
