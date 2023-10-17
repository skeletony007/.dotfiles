syntax on

colorscheme catppuccin_frappe
set guicursor=""

set termguicolors

set nu
set relativenumber
set cursorline

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set smartindent
set backspace=indent,eol,start

set wrap!

set swapfile!
set nobackup
set undodir=~/.vim/undodir
set undofile

set hlsearch!
set incsearch

" Case insensitive search.
"
" https://stackoverflow.com/questions/2287440/how-to-do-case-insensitive-search-in-vim
"
" Examples:
"
" ```
" /copyright      " Case insensitive
" /Copyright      " Case sensitive
" /copyright\C    " Case sensitive
" /Copyright\c    " Case insensitive
" ```
set ignorecase
set smartcase

set scrolloff=8

set updatetime=50

set colorcolumn=80
" set textwidth=80

