call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'skielbasa/vim-material-monokai'
Plug 'preservim/nerdtree'
Plug 'valloric/youcompleteme'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()
syntax on
set nocompatible
filetype on
filetype plugin on
set number
set ignorecase
set hlsearch
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set mouse=a
set expandtab
set tabstop=4
color material-monokai
