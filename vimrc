"
" Jim's minimal vimrc
"

set nocompatible


" syntax and filetypes
syntax on
filetype plugin indent on

" backups
set nobackup

" colors
set termguicolors  " use scheme colors in terminal
colorscheme desert

" keys
inoremap jk <Esc> " use jk for esc

" general
set number	" show line numbers
set linebreak	" break lines at word (requires Wrap lines)
set showbreak=+++ 	" wrap-broken line prefix
set textwidth=100	" line wrap (number of cols)
set showmatch	" highlight matching brace
set visualbell	" use visual bell (no beeping)
 
set hlsearch	" highlight all search results
set smartcase	" enable smart-case search
set ignorecase	" always case-insensitive
set incsearch	" searches for strings incrementally
 
set autoindent	" auto-indent new lines
set expandtab	" use spaces instead of tabs
set shiftwidth=4	" number of auto-indent spaces
set smartindent	" enable smart-indent
set smarttab	" enable smart-tabs
set softtabstop=4	" number of spaces per Tab
 
set ruler	" show row and column ruler information
 
set undolevels=1000	" number of undo levels
set backspace=indent,eol,start	" backspace behaviour
