# file: .latexmkrc
# Dùng trình biên dịch XeLaTeX để biên dịch file nguồn .tex thành .pdf
$pdf_mode = 1;

$pdflatex = 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S';
# Sử dụng biber để xử lý tài liệu tham khảo
$bibtex = 'biber %O %S';

# Di chuyển tất cả các file tạm vào thư mục build/
$out_dir = 'build';
