runtime! debian.vim

syntax on


" Jump to the last position when reopening a file.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set wildmenu		" Better command-line completion
set number
set relativenumber
set confirm		" Confirm dialog asking if files should be saved.
set nocompatible " Required for vimwiki.
set colorcolumn=80
set cursorcolumn

" Indentation
set tabstop=2		" Width of a tab character in spaces.
set shiftwidth=2	" Size of an indent.
set softtabstop=2	" Number of columns for a tab.
set expandtab		" Expand tab to spaces.
set autoindent

execute pathogen#infect()
execute pathogen#helptags()

filetype plugin indent on

autocmd Filetype python setlocal tabstop=4 shiftwidth=4 softtabstop=4

autocmd Filetype pascal nmap <buffer> <F5> :w<bar>!fpc % && ./%:r<CR>

" Theme
colorscheme jellybeans
set background=dark

" Key remapping
nnoremap t <C-]>

" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
set conceallevel=1
let g:tex_conceal='abdmg'

" fzf plugin
set rtp+=/usr/bin/fzf

" ale plugin
let b:ale_fixers = {'python': ['autopep8']}
let b:ale_linters = {'python': ['pylint']}
let g:ale_fix_on_save = 1

