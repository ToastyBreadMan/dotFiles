syntax on
let g:dracula_colorterm = 0
set cursorline
color dracula

set tabstop=4
set softtabstop=4
set shiftwidth=4
set showcmd
set nocompatible
set smartindent

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
