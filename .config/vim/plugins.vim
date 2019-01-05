call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'townk/vim-autoclose'
Plug 'Chiel92/vim-autoformat'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree',                     { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin',             { 'on':  'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }
Plug 'matze/vim-move'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-sensible'
Plug 'godlygeek/tabular'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Valloric/YouCompleteMe',                  { 'do': './install.py' }

" tmux
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'madnight/vim-tmux-resizer'
" Plug 'benmills/vimux', { 'on': 'VimuxRunCommand' }

call plug#end()
