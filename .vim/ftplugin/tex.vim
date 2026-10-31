nnoremap <leader>s <c-g>u<Esc>[s1z=`]a<c-g>u
nnoremap <leader>v <cmd>w!<cr><cmd>!texfot --quiet pdflatex -interaction=batchmode -synctex=1 --shell-escape %<<cr>
nnoremap <leader>d <cmd>w!<cr><cmd>!texfot --quiet lualatex -interaction=batchmode -synctex=1 --shell-escape main<cr>
nnoremap <leader>n <cmd>w!<cr><cmd>!texfot --quiet lualatex -interaction=batchmode -synctex=1 --shell-escape %<<cr>
nnoremap <leader>V <cmd>w!<cr><cmd>!texfot --quiet pdflatex -synctex=1 --shell-escape %<<cr>
nnoremap <leader>D <cmd>w!<cr><cmd>!texfot --quiet lualatex -synctex=1 --shell-escape main<cr>
nnoremap <leader>N <cmd>w!<cr><cmd>!texfot --quiet lualatex -synctex=1 --shell-escape %<<cr>
nnoremap <leader>b <cmd>w!<cr><cmd>!bibtex main<cr>

set conceallevel=2
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none
