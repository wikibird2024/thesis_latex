
# =======================================================
# Latexmk configuration: XeLaTeX + Biber + minted + pvc
# =======================================================

# PDF mode trực tiếp
$pdf_mode = 4;

# Engine chính
$pdflatex = 'xelatex -synctex=1 -shell-escape -interaction=nonstopmode %O %S';

# Continuous preview
$preview_continuous_mode = 1;

# Force build tiếp tục nếu có cảnh báo
$force_mode = 1;

# File gốc
@default_files = ('main.tex');

# Bibliography
$biber = 'biber %O %B';
$bibtex_use = 2;

# Clean file tạm, không xóa cache minted
$clean_ext = 'aux log out toc bbl blg run.xml nav snm synctex.gz fdb_latexmk fls';
$cleanup_includes_cusdep_generated = 0;

# PDF viewer
if (system("command -v zathura >/dev/null 2>&1") == 0) {
    $pdf_previewer = 'zathura %O %S';
} elsif (system("command -v okular >/dev/null 2>&1") == 0) {
    $pdf_previewer = 'okular %S';
} elsif (system("command -v evince >/dev/null 2>&1") == 0) {
    $pdf_previewer = 'evince %S';
} else {
    $pdf_previewer = 'xdg-open %S';
}
