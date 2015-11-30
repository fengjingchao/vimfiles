set nocompatible              " be iMproved, required
filetype off                  " required


" Use Vundle to manage plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
source ~/.vim/vim.bundles
call vundle#end()

filetype plugin indent on

" More powerful backspacing
set backspace=indent,eol,start

syntax on
set bs=2        " allow backspacing over everything in insert mode
set history=1000
set autoread        " auto read when file is changed from outside

" Optimize scrolling
set ttyfast
set ttyscroll=3
set lazyredraw

" Matching
set showmatch       " Show matching brackets.
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set ignorecase      " Do case insensitive matching
set hlsearch        " search highlighting

set autoindent      " auto indentation
set cindent
set copyindent      " copy the previous indentation on autoindenting
set smarttab        " insert tabs on the start of a line according to context
" :set paste if having indentation problem

" set clipboard=unnamed

" Status
set showcmd         " Show (partial) command in status line.
set laststatus=2    " Always show status bar
set ruler           " Show cursor position
set nonumber          " Show line number

set showmode        " Show current mode
set wildchar=<TAB>  " start wild expansion in the command line using <TAB>
set wildmenu            " wild char completion menu
set cursorline        " highlight current line
set completeopt-=preview

"set guioptions-=m  "remove menu bar
"set guioptions-=T  "remove toolbar
"set guioptions-=r  "remove right-hand scroll bar
"set guioptions-=L  "remove left-hand scroll bar

" display indentation guides
"set list listchars=tab:→\ ,trail:·,extends:»,precedes:«,nbsp:×
set list listchars=tab:\ \ ,trail:·,extends:»,precedes:«,nbsp:×


if has("gui_running")   " GUI color and font settings
  set guifont=Monaco:h14
  "colors solarized
  "set bg=light
  colors onedark
  set bg=dark
  "highlight CursorLine          guibg=#A7D7BD ctermbg=24  gui=none cterm=none
else " terminal color settings
  colors vgod
endif

" auto reload vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" C/C++ specific settings
autocmd FileType c,cpp,cc  setlocal cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" TAB setting
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" specific file types tab setting
au FileType go,Makefile setlocal noexpandtab


"---------------------------------------------------------------------------
" USEFUL SHORTCUTS
"---------------------------------------------------------------------------
" set leader to ;
let mapleader=";"
let g:mapleader=";"

" go to prev tab
map <C-H> gT
" go to next tab
map <C-L> gt

" ,/ turn off search highlighting
nmap <leader>/ :nohl<CR>

" Command mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-f> <Right>
cnoremap <C-b> <left>

" Toggle pastemode
nmap <leader>p :set paste!<BAR>set paste?<CR>

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv

" :cd. change working directory to that of the current file
cmap cd. lcd %:p:h

" create .vimtmp in home directory
set backupdir=./.backup,~/.vimtmp,/tmp
set directory=./.backup,~/.vimtmp,/tmp

nmap <c-a> <Home>
nmap <c-e> <End>

" open each buffer in its own tabpage
" use 'gvim -p *' or ':tab sball'

nmap <CR> o
nmap <BS> i<BS>
imap <C-d> <Del>
imap <c-s> <esc>:w<cr>a
map <c-s> :w<cr>
map <Leader>w :w<cr>
map <leader>q :q<cr>


set nowrap

" -----------------------------
"  PLUGIN SETTINGS
" -----------------------------

"""""""""""""""""""""""""""""""
" CtrlP
"""""""""""""""""""""""""""""""
nmap <leader>f :CtrlPMixed<cr>
nmap <leader>bf :CtrlPBuffer<cr>
nmap <leader>mr :CtrlPMRU<cr>
nmap <leader>. :CtrlPTag<cr>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.*,_*

"if exists("g:ctrlp_user_command")
  "unlet g:ctrlp_user_command
"endif
"let g:ctrlp_user_command = {
    "\ 'types': {
        "\ 1: ['.git', 'cd %s && git ls-files'],
        "\ 2: ['.hg', 'hg --cwd %s locate -I .'],
        "\ },
    "\ 'fallback': 'find %s -type f'
    "\ }
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
let g:ctrlp_max_height = 20


" Nerd Tree
let NERDChristmasTree=1
let NERDTreeWinSize=25
nmap <F7> :NERDTreeToggle<cr>
map <leader>1 :NERDTreeToggle<CR>

" TagBar
nmap <F8> :Tagbar<cr>

" Syntastic
nmap <leader>st :SyntasticToggle<cr>

" youcompleteme
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" Jedi There are also some VIM options (like completeopt and key defaults)
" which are automatically initialized, but you can change all of them:
let g:jedi#popup_select_first = 0

" Golang
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
