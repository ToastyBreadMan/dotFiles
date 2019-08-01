" |------------------------|
" | Configuration Settings |
" |------------------------|
syntax on									" Gimme Colors
set nocompatible							" Use vim

set encoding=utf-8                          " use utf8
set fileencoding=utf-8                      " use utf8
set termencoding=utf-8                      " use utf8

set tabstop=4                               " Set tab to 4 spaces
set softtabstop=4                           " Soft tabs are good
set shiftwidth=4                            " 
set smartindent                             " Indent well

set scrolloff=5                             " Keep 5 lines above cursor
set sidescrolloff=5                         " Keep 5 characters after cursor

set cursorline                              " Show cursorline
set backspace=indent,eol,start              " Delete newlines
set incsearch hlsearch                      " Highlight searches

set splitbelow                              " Split below
set splitright                              " Split right

set showcmd                                 " Show last command
set ruler                                   " Show ruler at bottom

" |----------------|
" | Plugin Install |
" |----------------|

" Put plug specific options here
function Plug_setup()
	let g:dracula_colorterm = 0
	color dracula
endfunction

" |----------------|
" | File Managment |
" |----------------|

" Move temp files to safe directory to protect against CVE-2017-1000382
" Essentially .swp files can be global readable, so make them safe
let vimhome=$HOME . "/.vim"
let &g:directory=vimhome . "/swap//"
let &g:backupdir=vimhome."/backup//"
let &g:undodir=vimhome."/undo//"

" if the directories don't exist, create them
if ! isdirectory(expand(&g:directory))
	call mkdir(expand(&g:directory), "p", 0700)
endif

if ! isdirectory(expand(&g:backupdir))
	call mkdir(expand(&g:backupdir), "p", 0700)
endif

if ! isdirectory(expand(&g:undodir))
	call mkdir(expand(&g:undodir), "p", 0700)
endif

set backup
set undofile
set undolevels=1000
set undoreload=10000

" |---------|
" | Rebinds |
" |---------|

" Mapleader
let mapleader = ","

" Split remaps
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Editing vimrc remaps
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Wrapping remaps
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>
nnoremap <leader>( viw<esc>a)<esc>bi(<esc>lel
vnoremap <leader>( <esc>`<i(<esc>`>a)<esc>
nnoremap <leader>[ viw<esc>a]<esc>bi[<esc>lel
vnoremap <leader>[ <esc>`<i[<esc>`>a]<esc>
nnoremap <leader>{ viw<esc>a}<esc>bi{<esc>lel
vnoremap <leader>{ <esc>`<i{<esc>`>a}<esc>

" Movement maps
nnoremap H ^
nnoremap L $
inoremap jk <esc>

" Strict movement
inoremap <esc> <nop>
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>

" Abbreviations 
iabbrev todo TODO:
iabbrev fixme FIXME:
