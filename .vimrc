syntax on


" Uncomment the following to have Vim jump to the last position when
" reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set number
set cursorline
set cc=81

"-------------------------------------------------------------------------------
" gui settings
"-------------------------------------------------------------------------------
set guifont=Monospace\ 14
" set guioptions-=m     " Disable menu bar
" set guioptions-=T       " Disable toolbar
" set guioptions=c        " Use console dialogs instead of popup dialogs
if has("gui_running")
  set lines=35 columns=150
endif

"-------------------------------------------------------------------------------
" Indendation settings
"-------------------------------------------------------------------------------
set shiftwidth=2
set softtabstop=2
set expandtab
autocmd Filetype python setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Key remapping
" Jump to tag with t and jump back with Ctrl-t, as remapped here:
nnoremap t <C-]>

"-------------------------------------------------------------------------------
" vim-plug
"-------------------------------------------------------------------------------
call plug#begin()
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-fugitive'
call plug#end()
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
" vimwiki
"-------------------------------------------------------------------------------
let g:vimwiki_auto_header = 1
let g:vimwiki_global_ext = 0 " do not use vimwiki filetype outside of vimwiki directory
let g:netrw_liststyle=3
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
" Keyboard shortcuts
"-------------------------------------------------------------------------------
autocmd Filetype python nmap <buffer> <F5> :w<bar>!python3 % <CR>
autocmd Filetype pascal nmap <buffer> <F5> :w<bar>!fpc % && ./%:r<CR>
autocmd Filetype markdown nmap <buffer> <F5> :w<bar>!pandoc % -o %:r.pdf<CR>
autocmd Filetype c nmap <buffer> <F5> :w<bar>!gcc % -o %:r && ./%:r<CR>
autocmd Filetype php nmap <buffer> <F5> :w<bar>!php % <CR>
autocmd Filetype tex nmap <buffer> <F5> :w<bar>!pdflatex % <CR>

colorscheme lunaperche
