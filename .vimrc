colorscheme darcula
set termguicolors

" Enable filetype plugins available in ~/.vim/ftplugins
filetype plugin on

set number " Line number
syntax on " Syntax highlighting
set cursorline " Highlight current line

" Change cursor on insert
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

set encoding=utf-8
set autoindent

set showcmd " See leader
set showmode " Show INSERT and VISUAL in status bar
set ruler " Show line number info in status bar
set rulerformat=%l,%c%V%=%P

let mapleader = ","
