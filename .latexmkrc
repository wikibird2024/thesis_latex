
# ===============================
# Latexmk config (XeLaTeX + Biber + Minted)
# Author: Ginko
# ===============================

# ─── Engine Configuration ────────────────────────────────────────────────
# Dùng XeLaTeX với minted (cần bật -shell-escape cho Pygments)
$pdflatex = 'xelatex -shell-escape -interaction=nonstopmode -synctex=1 %O %S';
$latex    = $pdflatex;

# ─── Bibliography Engine ────────────────────────────────────────────────
# Dùng Biber thay cho BibTeX
$biber = 'biber --input-directory=%D --output-directory=%D %B';

# ─── PDF Viewer (Linux Mint friendly) ───────────────────────────────────
# Zathura hỗ trợ synctex rất tốt; có thể thay bằng evince hoặc okular
$pdf_previewer = 'zathura %S';

# ─── Error & Log Handling ───────────────────────────────────────────────
# Giữ file .fls, .fdb_latexmk để latexmk nhận biết dependency
$recorder = 1;

# Luôn cố gắng sinh PDF ngay cả khi có lỗi nhỏ
$pdf_mode = 1;     # 1 = pdfLaTeX/XeLaTeX, 5 = LuaLaTeX
$force_mode = 1;   # build PDF dù có lỗi không nghiêm trọng

# ─── Cleanup Behavior ───────────────────────────────────────────────────
# Dọn file tạm khi build thành công
$cleanup_includes_cusdep_generated = 1;

# Danh sách file phụ cần xóa với `latexmk -c`
@generated_exts = qw(
  aux bbl bcf blg fdb_latexmk fls log out run.xml toc lof lot lol
  synctex.gz idx ilg ind acr acn glo gls ist xdy
);

# ─── Automatic Build Mode ───────────────────────────────────────────────
# Khi gọi `latexmk -pvc`, theo dõi file thay đổi và rebuild tự động
$pvc_view_file_via_temporary = 0;

# ─── Custom Dependencies (optional, advanced users) ─────────────────────
# Minted có thể cần chạy lại nếu file .pyg thay đổi
add_cus_dep('pyg', 'tex', 0, 'do_nothing');

# ─── Optional: Notification ─────────────────────────────────────────────
# Khi build xong, có thể bật âm thanh hoặc notify-send
# $postscript_mode = 1;
# system("notify-send 'LaTeX build complete'");
