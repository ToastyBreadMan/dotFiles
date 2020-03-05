"__   _(_)_ __ ___  _ __ ___ 
"\ \ / / | '_ ` _ \| '__/ __|
" \ V /| | | | | | | | | (__ 
"  \_/ |_|_| |_| |_|_|  \___|

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

set nowrap
set scrolloff=5                             " Keep 5 lines above cursor
set sidescrolloff=5                         " Keep 5 characters after cursor
set sidescroll=1							" Scroll one character at a time

set cursorline                              " Show cursorline
set backspace=indent,eol,start              " Delete newlines
set incsearch hlsearch                      " Highlight searches

set splitbelow                              " Split below
set splitright                              " Split right

set showcmd                                 " Show last command
set ruler                                   " Show ruler at bottom
let s:hidden_all = 0

" |----------------|
" | File Managment |
" |----------------|

" Move temp files to safe directory to protect against CVE-2017-1000382
" Essentially .swp files can be global readable, so make them safe
let vimhome=$HOME . "/.vim"
let &g:directory=vimhome . "/swap//"
let &g:backupdir=vimhome . "/backup//"
let &g:undodir=vimhome . "/undo//"

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

set undofile
set undolevels=1000
set undoreload=10000

" |----------------|
" | Plugin Install |
" |----------------|

" Run 'call Plug_Setup' to install plugins

function Plug_Install()

	" Plugin directories
	let plug_dir=$HOME . "/.vim/pack/plugins/"
	let plug_start=plug_dir . "start/"
	let plug_opt=plug_dir . "opt/"

	" Check if git is installed
	if executable("git") == -1
		echom "git is needed for plugins to be installed"
		return
	endif

	" Set up directory structures
	if ! isdirectory(expand(plug_start))
		call mkdir(expand(plug_start), "p", 0755)
	endif

	if ! isdirectory(expand(plug_opt))
		call mkdir(expand(plug_opt), "p", 0755)
	endif

	" |=========|
	" | Dracula |
	" |=========|

	if ! isdirectory(expand(plug_start . "dracula-theme"))
		execute "!git clone https://github.com/dracula/vim.git" . " " . plug_start . "dracula-theme"
	endif

	" |===========|
	" | Syntastic |
	" |===========|

	if ! isdirectory(expand(plug_start . "syntastic"))
		execute "!git clone https://github.com/vim-syntastic/syntastic.git" . " " . plug_start . "syntastic"
	endif

endfunction

" Load all packages in the 'start' package directory
" 'opt' packages must be loaded with 'packadd!'
packloadall!

" Dracula settings
try
	let g:dracula_colorterm = 0
	let g:dracula_italic = 0
	colorscheme dracula
catch
endtry

" Syntastic settings
try
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*

	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_open = 0
	let g:syntastic_check_on_wq = 0
catch
endtry


" |-----------|
" | Functions |
" |-----------|

function! ToggleHiddenAll()
	if s:hidden_all  == 0
		let s:hidden_all = 1
		set noshowmode
		set noruler
		set laststatus=0
		set noshowcmd
	else
		let s:hidden_all = 0
		set showmode
		set ruler
		set laststatus=2
		set showcmd
	endif
endfunction


" |---------|
" | Rebinds |
" |---------|

" Mapleader
let mapleader = ","

" Use arrow keys in insert mode
" Yes I know this is heresy
inoremap <esc>0A <esc>ki
inoremap <esc>0B <esc>ji
inoremap <esc>0C <esc>li
inoremap <esc>0D <esc>hi

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

" Function calls
nnoremap <S-h> :call ToggleHiddenAll()<CR>

" |---------------|
" | Abbreviations |
" |---------------|

iabbrev todo TODO:
iabbrev fixme FIXME:

" |---------------|
" | Auto commands |
" |---------------|

augroup markdown
	autocmd!
	autocmd BufNewFile,BufRead *.md setlocal colorcolumn=80
	autocmd BufNewFile,BufRead *.md setlocal spell
	autocmd BufNewFile,BufRead *.md setlocal commentstring=<!--\ %s\ -->
augroup END
