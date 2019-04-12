filetype plugin indent on
syntax on
let mapleader="\,"

set nocompatible
set number
set clipboard=unnamedplus
set hidden
set incsearch
set ignorecase
set smartcase
set hlsearch
set expandtab
set shiftwidth=4
set encoding=utf-8
set autoindent
set smartindent

source ~/.config/vim/plugins.vim
source ~/.config/vim/keys.vim

syntax on
colorscheme lucius
LuciusDarkLowContrast

let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"

" Airline setup
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = "lucius"
