call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'Raimondi/delimitMate'
Plug 'Chiel92/vim-autoformat'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree',                     { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin',             { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-sensible'
Plug 'godlygeek/tabular'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Valloric/YouCompleteMe',                  { 'do': './install.py' }
Plug 'tpope/vim-commentary'

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'melonmanchan/vim-tmux-resizer'
" Plug 'benmills/vimux', { 'on': 'VimuxRunCommand' }

call plug#end()
