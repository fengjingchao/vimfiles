" Use Vundle to manage plugins {
    set nocompatible

    filetype off

    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    source ~/.vim/vim.bundles
    filetype plugin indent on
" }

set bs=2		" allow backspacing over everything in insert mode
set history=1000
set ruler		" show the cursor position all the time
set autoread		" auto read when file is changed from outside

filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
syntax on		" syntax highlight

" Matching
set showmatch       " Show matching brackets.
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set ignorecase      " Do case insensitive matching
set hlsearch		" search highlighting

set autoindent		" auto indentation
set cindent
set copyindent		" copy the previous indentation on autoindenting
set smarttab		" insert tabs on the start of a line according to context
" :set paste if having indentation problem
set clipboard=unnamed

" Status
set showcmd         " Show (partial) command in status line.
set laststatus=2    " Always show status bar
set ruler           " Show cursor position
set number          " Show line number
set showmode		" Show current mode
set wildchar=<TAB>	" start wild expansion in the command line using <TAB>
set wildmenu            " wild char completion menu
set cursorline        " highlight current line


if has("gui_running")	" GUI color and font settings
  set guifont=Consolas\ 14
  set background=light
  set t_Co=256          " 256 color mode
  colors peaksea
  "highlight CursorLine          guibg=#A7D7BD ctermbg=24  gui=none cterm=none
else
" terminal color settings
  colors vgod
endif


" C/C++ specific settings
autocmd FileType c,cpp,cc  set cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" make CSS omnicompletion work for SASS and SCSS
autocmd BufNewFile,BufRead *.scss   set ft=scss.css
autocmd BufNewFile,BufRead *.sass   set ft=sass.css

" TAB setting{
    set expandtab        "replace <TAB> with spaces
    set softtabstop=2
    set shiftwidth=2
    set linespace=2
" }

autocmd FileType python setlocal shiftwidth=4 softtabstop=4
autocmd FileType make   setlocal noexpandtab shiftwidth=4 softtabstop=4 tabstop=4

"---------------------------------------------------------------------------
" USEFUL SHORTCUTS
"---------------------------------------------------------------------------
" set leader to ,
let mapleader=";"
let g:mapleader=";"

" --- move around splits {
" move to and maximize the below split
nmap <C-j> <C-w>j
" move to and maximize the above split
nmap <C-k> <C-w>k
" move to and maximize the left split
nmap <c-h> <c-w>h
" move to and maximize the right split
nmap <c-l> <c-w>l
" }

" go to prev tab
map <S-H> gT
" go to next tab
map <S-L> gt

" new tab
map <C-t><C-t> :tabnew<CR>
" close tab
map <C-t><C-w> :tabclose<CR>

" ,/ turn off search highlighting
nmap <leader>/ :nohl<CR>

" Command mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-f> <Right>
cnoremap <C-b> <left>

nmap <leader>p :set paste!<BAR>set paste?<CR>

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv

" :cd. change working directory to that of the current file
cmap cd. lcd %:p:h

" Header guard: very useful for C
map <leader>gd :call IncludeGuard()<CR>
fun! IncludeGuard()
   let basename = substitute(bufname(""), '.*/', '', '')
   let guard = '_' . substitute(toupper(basename), '\.', '_', "H")
   call append(0, "#ifndef " . guard)
   call append(1, "#define " . guard)
   call append( line("$"), "#endif // for #ifndef " . guard)
endfun


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
map <Leader>m :w<cr>
map <leader>q :q<cr>
set scrolloff=999


set nowrap
" set text boundary for code
set tw=72
setlocal formatoptions += =aw2tq



" -----------------------------
"  PLUGIN SETTINGS
" -----------------------------

" Ultisnips youcompleteme setting
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-l>"
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"""""""""""""""""""""""""""""""
" CtrlP
"""""""""""""""""""""""""""""""
nmap <leader>f :CtrlPMixed<cr>
nmap <leader>bf :CtrlPBuffer<cr>
nmap <leader>r :CtrlPMRU<cr>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|o|a|swp|so|dll)$',
  \ }
let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_max_height = 20


" Nerd Tree
let NERDChristmasTree=1
let NERDTreeWinSize=25
nmap <F8> :NERDTreeToggle<cr>

" Tagbar
nmap <F7> :TagbarToggle<CR>

" Vim session
let g:session_autosave='no'
let g:session_autoload='no'

