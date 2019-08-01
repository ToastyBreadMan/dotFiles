syntax on

if &compatible
	set nocompatible
endif

" Colorscheme
let g:dracula_colorterm = 0
color dracula

" QOL stuffs
set cursorline
set backspace=indent,eol,start
set ruler

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

" Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set showcmd

" Scroll settings
set scrolloff=5

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

set splitbelow
set splitright
