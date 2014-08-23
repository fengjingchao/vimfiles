vimfiles
========

Suggested Auto Formatter
------
Not included in this repo.

- Go: gofmt
- C: astyle
- Python: autopep8

Shortcut Manual
------
Default `<leader>` is `";"`

### CtrlP

* `<leader>p` : CtrlP
* `<leader>f` : CtrlP Mixed
* `<leader>bf` : CtrlP Buffer
* `<leader>mr` : CtrlP MRU (Most Recently Used)
* `<leader>.` : CtrlP Tag (In combination use with **CTags**)

### NerdTree, TagBar, Syntastic
* `<leader>nd` : Toggle NerdTree
* `<F7>` : Toggle NerdTree
* `<F8>` : Toggle TagBar
* `<leader>st` : Toggle Syntastic

### Common
* `<C-j/k/h/l>` : move around window splits
* `<S-H/L>` : move around tabs
* `<C-o>` : open new tab and also CtrlP to find file
* `<leader>/` : turn off search highlight
* `<leader>p` : toggle paste mode
* `<C-a>` : `<Home>`
* `<C-e>` : `<End>`

        nmap <CR> o
        nmap <BS> i<BS>
        imap <C-d> <Del>
        imap <c-s> <esc>:w<cr>a
        map <c-s> :w<cr>
        map <Leader>w :w<cr>
        map <leader>q :q<cr>

### Go development
* `<leader>v` : open GoDef
* `<leader>s`
* `<leader>t`
* `<leader>gd` : open GoDoc
* `<leader>gv`
* `<leader>r` : go run

### Command Mode
* `<C-a>` `<Home>`
* `<C-e>` `<End>`
* `<C-p>` `<Up>`
* `<C-n>` `<Down>`
* `<C-f>` `<Right>`
* `<C-b>` `<left>`
* `cd.` : change to current directory

