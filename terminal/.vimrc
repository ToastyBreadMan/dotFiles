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

set pastetoggle=<F2>

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

" |--------|
" | cscope |
" |--------|

" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim... 
if has("cscope")

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out  
    " else add the database pointed to by environment variable 
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose  


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.  
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>	

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	


    " Hitting CTRL-space *twice* before the search type does a vertical 
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout 
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout 
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100

endif

" |---------------|
" | Auto commands |
" |---------------|

augroup markdown
	autocmd!
	autocmd BufNewFile,BufRead *.md setlocal colorcolumn=80
	autocmd BufNewFile,BufRead *.md setlocal spell
	autocmd BufNewFile,BufRead *.md setlocal commentstring=<!--\ %s\ -->
augroup END

autocmd BufReadPost * silent! normal! g`"zv
