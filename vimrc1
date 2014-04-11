" Use Vundle to manage plugins {
    set nocompatible

    filetype off

    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    source ~/.vim/vim.bundles
" }

set rtp+=$GOROOT/misc/vim

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
set completeopt-=preview
"set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

if has("gui_running")	" GUI color and font settings
  set guifont=Consolas\ 12
  set t_Co=256          " 256 color mode
  colors Tomorrow-Night-Eighties
  set bg=dark
  "highlight CursorLine          guibg=#A7D7BD ctermbg=24  gui=none cterm=none
else
" terminal color settings
  colors vgod
endif

" Go Setting
au FileType go au BufWritePre <buffer> Fmt
let g:gofmt_command = "goimports"

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


""""""""""""""""""""""""""""""""""""
" AUTO COMPLETE SYSTEM
""""""""""""""""""""""""""""""""""""

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.go = '[^.[:digit:] *\t]\.\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" Jedi There are also some VIM options (like completeopt and key defaults)
" which are automatically initialized, but you can change all of them:
let g:jedi#popup_select_first = 0
let g:jedi#auto_vim_configuration = 0
