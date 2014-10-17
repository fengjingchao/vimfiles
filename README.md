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
* `<c-o>` : Toggle NerdTree
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

### Command Mode
* `<C-a>` `<Home>`
* `<C-e>` `<End>`
* `<C-p>` `<Up>`
* `<C-n>` `<Down>`
* `<C-f>` `<Right>`
* `<C-b>` `<left>`
* `cd.` : change to current directory

### Golang IDE
vim-go has several `<Plug>` mappings which can be used to create custom
mappings. Below are some examples you might find useful:

Show a list of interfaces which is implemented by the type under your cursor
with `<leader>s` 

```vim
au FileType go nmap <Leader>s <Plug>(go-implements)
```

Show type info for the word under your cursor with `<leader>i` (useful if you
have disabled auto showing type info via `g:go_auto_type_info`)

```vim
au FileType go nmap <Leader>i <Plug>(go-info)
```

Open the relevant Godoc for the word under the cursor with `<leader>gd` or open
it vertically with `<leader>gv`

```vim
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
```

Or open the Godoc in browser

```vim
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
```

Run commands, such as  `go run` with `<leader>r` for the current file or `go
build` and `go test` for the current package with `<leader>b` and `<leader>t`.
Display a beautiful annotated source code to see which functions are covered
with `<leader>c`.

```vim
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
```

Replace `gd` (Goto Declaration) for the word under your cursor (replaces current buffer):

```vim
au FileType go nmap gd <Plug>(go-def)
```

Or open the definition/declaration in a new vertical, horizontal or tab for the
word under your cursor:

```vim
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
```
Rename the identifier under the cursor to a new name

```vim
au FileType go nmap <Leader>e <Plug>(go-rename)
```

More `<Plug>` mappings can be seen with `:he go-mappings`. Also these are just
recommendations, you are free to create more advanced mappings or functions
based on `:he go-commands`.

