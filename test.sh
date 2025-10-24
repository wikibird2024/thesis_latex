
#!/bin/bash
rm -f *.aux *.log *.out *.toc *.bbl *.bcf *.blg *.run.xml *.nav *.snm *.synctex.gz
xelatex --shell-escape test.tex
biber test
xelatex --shell-escape test.tex
xelatex --shell-escape test.tex
zathura test.pdf
