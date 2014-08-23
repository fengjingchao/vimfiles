" Use Vundle to manage plugins {
  set nocompatible

  filetype off

  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
  source ~/.vim/vim.bundles
" }

set bs=2        " allow backspacing over everything in insert mode
set history=1000
set ruler       " show the cursor position all the time
set autoread        " auto read when file is changed from outside

filetype on
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
syntax on       " syntax highlight

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
set clipboard=unnamed

" Status
set showcmd         " Show (partial) command in status line.
set laststatus=2    " Always show status bar
set ruler           " Show cursor position
set number          " Show line number
set showmode        " Show current mode
set wildchar=<TAB>  " start wild expansion in the command line using <TAB>
set wildmenu            " wild char completion menu
set cursorline        " highlight current line
set completeopt-=preview
"set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

if has("gui_running")   " GUI color and font settings
  set guifont=Monaco:h12
  set t_Co=256          " 256 color mode
  colors freya
"  set bg=light "magic
"  set bg=dark
  "highlight CursorLine          guibg=#A7D7BD ctermbg=24  gui=none cterm=none
else
" terminal color settings
  colors vgod
endif

" C/C++ specific settings
autocmd FileType c,cpp,cc  setlocal cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" make CSS omnicompletion work for SASS and SCSS
autocmd BufNewFile,BufRead *.scss   setlocal ft=scss.css
autocmd BufNewFile,BufRead *.sass   setlocal ft=sass.css

" TAB setting {
  set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
" }

" specific file types tab setting
au FileType go,Makefile setlocal noexpandtab
au FileType python,html,xml,ruby,javascript,vim,sh setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" display indentation guides
"set list listchars=tab:❘\ ,trail:·,extends:»,precedes:«,nbsp:×
set list listchars=tab:→\ ,trail:·,extends:»,precedes:«,nbsp:×

" convert spaces to tabs when reading file
"autocmd! bufreadpost * set noexpandtab | retab! 4

" convert tabs to spaces before writing file
"autocmd! bufwritepre * set expandtab | retab! 4

" convert spaces to tabs after writing file (to show guides again)
"autocmd! bufwritepost * set noexpandtab | retab! 4

"---------------------------------------------------------------------------
" USEFUL SHORTCUTS
"---------------------------------------------------------------------------
" set leader to ;
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
map <C-o> :tabnew<CR>:CtrlPBuffer<CR>

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
set scrolloff=999


set wrap
"set tw=80
" formatoptions:
" - a : auto format
" - c : autowrap comments using textwidth
" - w : trailing whitespace paragraph continues
" - 2 : second line as indent guide
" - q : allowing formating comments with 'gq'
"set fo=aw2cq


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
nmap <F7> :NERDTreeToggle<cr>
nmap <leader>nd :NERDTreeToggle<cr>

" TagBar
nmap <F8> :Tagbar<cr>

" Syntastic
nmap <leader>st :SyntasticToggle<cr>

" Vim session
let g:session_autosave='no'
let g:session_autoload='no'

" youcompleteme
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" Jedi There are also some VIM options (like completeopt and key defaults)
" which are automatically initialized, but you can change all of them:
let g:jedi#popup_select_first = 0

" Go Development
au Filetype go nnoremap <leader>v  :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s  :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t  :tab split <CR>:exe "GoDef"<CR>
au FileType go nmap     <Leader>gd  <Plug>(go-doc)
au FileType go nmap     <Leader>gv  <Plug>(go-doc-vertical)
au Filetype go nnoremap <leader>r  :GoRun %<CR>
