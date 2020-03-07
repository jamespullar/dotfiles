colorscheme darcula
set termguicolors

set number " Line number
syntax on " Syntax highlighting
set cursorline " Highlight current line

" Change cursor on insert
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

set encoding=utf-8
set autoindent

set showcmd " See leader
set showmode " Show INSERT and VISUAL in status bar
set ruler " Show line number info in status bar
set rulerformat=%l,%c%V%=%P

let mapleader = ","
