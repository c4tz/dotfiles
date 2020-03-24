filetype plugin indent on
syntax on
let mapleader="\,"

set nocompatible
set relativenumber
set number
set clipboard=unnamedplus
set hidden
set esckeys
set incsearch
set ignorecase
set smartcase
set hlsearch
set expandtab
set shiftwidth=4
set tabstop=4
set encoding=utf-8
set autoindent
set noswapfile
set smartindent
set colorcolumn=80
set noswapfile
set notimeout ttimeout ttimeoutlen=200

source ~/.config/vim/plugins.vim
source ~/.config/vim/keys.vim

syntax on
colorscheme lucius
LuciusDarkLowContrast

let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"

" automatically set same size for splits on window resize
autocmd VimResized * wincmd =

" auto close YouCompleteMe preview window
let g:ycm_autoclose_preview_window_after_completion=1

" Airline setup
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = "lucius"

let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
