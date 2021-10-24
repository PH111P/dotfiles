" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" Vim needs a POSIX-Compliant shell. Fish is not.
if $SHELL =~ 'bin/fish'
    set shell=/bin/sh
endif

call vundle#begin()

Plugin 'lervag/vimtex'
Plugin 'SirVer/ultisnips'
Plugin 'peder2tm/sved'
Plugin 'reedes/vim-wordy'

let g:wordy#ring = [
  \ 'weak',
  \ ['being', 'passive-voice', ],
  \ 'business-jargon',
  \ 'weasel',
  \ 'puffery',
  \ ['problematic', 'redundant', ],
  \ ['colloquial', 'idiomatic', 'similies', ],
  \ 'art-jargon',
  \ ['contractions', 'opinion', 'vague-time', 'said-synonyms', ],
  \ 'adjectives',
  \ 'adverbs',
  \ ]

nnoremap <Space> @q
noremap <silent> <F8> :<C-u>NextWordy<cr>
xnoremap <silent> <F8> :<C-u>NextWordy<cr>
inoremap <silent> <F8> <C-o>:NextWordy<cr>

let g:tex_flavor='lualatex'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/Repos/dotfiles/snippets']

syntax on
set number
set clipboard=unnamed

" Force to load vimrc from local dir
set exrc
set secure

" Set to auto read when a file is changed from the outside
set autoread

set list
set listchars=tab:>-

"SyncTex

nmap <leader>e :call SVED_Sync()<cr>

nmap <Leader>u :noh<CR>

function! WC()
    let filename = expand("%")
    let cmd = "detex " . filename . " | wc -w | tr -d [:space:]"
    let result = system(cmd)
    echo result . " words"
endfunction

command WC call WC()

" Fast saving
nmap <leader>w :w!<cr>

nmap <leader>m :w!<cr>:make! %<<cr>
nmap <leader>p :w!<cr>:!texfot --quiet pdflatex -synctex=1 --shell-escape %<<cr>
nmap <leader>a :w!<cr>:!texfot --quiet lualatex -synctex=1 --shell-escape main<cr>
nmap <leader>z :w!<cr>:!texfot --quiet lualatex -synctex=1 --shell-escape %<<cr>
nmap <leader>b :w!<cr>:!bibtex %<<cr>
nmap <leader>f :%py3f /usr/share/clang/clang-format.py<cr>:w!<cr>

:autocmd BufEnter *.cpp :inoremap ä \xe4|inoremap é \xe9|inoremap ö \xf6|inoremap ü \xfc|inoremap Ä \xc4|inoremap É \xc9|inoremap Ö \xd6|inoremap Ü \xdc|inoremap ß \xdf


" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" Configure backspace so it acts as it should act
" set backspace=eol,start,indent

set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

set completeopt=menu

set pastetoggle=<F2>

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=5

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set conceallevel=2

" Add a bit extra margin to the left
" set foldcolumn=1

try
    colorscheme elflord
catch
endtry

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 90 characters
set lbr
set tw=90

set spell

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%



" Always show the status line
set laststatus=2
set noshowmode

" set rtp+=/usr/lib/python3.6/site-packages/powerline/bindings/vim

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" let g:airline_theme='alduin'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1


let $CXXFLAGS='-std=c++20 -lm -lcrypt -g3 -ggdb'
let $CFLAGS='-std=c11 -lm -lcrypt -g3 -ggdb'

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

autocmd BufEnter * set mouse=

"autocmd vimenter * NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <F2> :NERDTreeToggle<CR>

let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" undo history
set undofile
set undodir=~/.vim/undo
set noswapfile " fuck these

" Enable filetype plugins
filetype on
filetype plugin indent on

" filetypes
au BufNewFile,BufRead *.ts,*.tsx set filetype=typescript

call vundle#end()

