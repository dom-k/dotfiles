" system-wide defaults, which this file overwrites
runtime! debian.vim

syntax on


" Jump to the last position when reopening a file.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

filetype plugin indent on

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set number
set cc=80
set relativenumber

" Indentation
set tabstop=2           " With of a tab character in spaces
set shiftwidth=2        " Size of an indent
set softtabstop=2       " Num of columns for a tab
set expandtab           " Expand tab to spaces
set autoindent

autocmd Filetype python setlocal tabstop=4 shiftwidth=4 softtabstop=4

" Enable pathogen
execute pathogen#infect()
execute pathogen#helptags()

" Color
colorscheme default
set background=dark

" fzf plugin
set rtp+=/usr/bin/fzf

" ale plugin
let b:ale_fixers = {'python': ['autopep8']}
let b:ale_linters = {'python': ['pylint']}
let g:ale_fix_on_save = 1

" vimwiki plugin
let g:vimwiki_list = [{'path': '~/Documents/notes/'}]

" Custom key mapping
nnoremap t <C-}>
