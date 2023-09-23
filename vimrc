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
    set shell=/bin/bash
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'lervag/vimtex'
Plugin 'SirVer/ultisnips'
Plugin 'peder2tm/sved'
Plugin 'reedes/vim-wordy'
Plugin 'KeitaNakamura/tex-conceal.vim'

if empty(v:servername) && exists('*remote_startserver')
    call remote_startserver('VIM')
endif

nnoremap <Space> @q

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

let g:tex_flavor='lualatex'

syntax on
set number

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

set clipboard=unnamed



" Force to load vimrc from local dir
set exrc
set secure

" Set to auto read when a file is changed from the outside
set autoread

set list
set listchars=tab:>-

let mapleader=';'

"SyncTex

" nmap <leader>e :call SVED_Sync()<cr>
let g:vimtex_view_method = 'sioyek'
nmap <leader>e :VimtexView<cr>

nmap <Leader>u :noh<CR>

function! WC()
    let filename = expand("%")
    let cmd = "detex " . filename . " | wc -w | tr -d [:space:]"
    let result = system(cmd)
    echo result . " words"
endfunction

command WC call WC()


" Fast saving
nnoremap <leader>w <cmd>w!<cr>

nnoremap <leader>m <cmd>w!<cr><cmd>make! %<<cr>
nmap <leader>f <cmd>%py3f /usr/share/clang/clang-format.py<cr>:w!<cr>

:autocmd BufEnter *.cpp <cmd>inoremap ä \xe4|inoremap é \xe9|inoremap ö \xf6|inoremap ü \xfc|inoremap Ä \xc4|inoremap É \xc9|inoremap Ö \xd6|inoremap Ü \xdc|inoremap ß \xdf


" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.aux,*.blg,*.bbl,*.brf,*.log,*.out
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
set backspace=indent,eol,start

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

" Add a bit extra margin to the left
" set foldcolumn=1

try
    colorscheme sorbet
    hi Normal guibg=NONE ctermbg=NONE
catch
endtry

nmap <silent> <A-Up> <cmd>wincmd k<CR>
nmap <silent> <A-Down> <cmd>wincmd j<CR>
nmap <silent> <A-Left> <cmd>wincmd h<CR>
nmap <silent> <A-Right> <cmd>wincmd l<CR>

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
vnoremap <silent> * <cmd>call VisualSelection('f', '')<CR>
vnoremap <silent> # <cmd>call VisualSelection('b', '')<CR>

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


let $CXXFLAGS='-std=c++23 -lm -lcrypt -g3 -ggdb'
let $CFLAGS='-std=c11 -lm -lcrypt -g3 -ggdb'

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

autocmd BufEnter * set mouse=

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

