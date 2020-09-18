""" Plugin list
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'Raimondi/delimitMate'
Plug 'Chiel92/vim-autoformat'
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree',                     { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin',             { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'bkad/CamelCaseMotion'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-commentary'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'chrisbra/SudoEdit.vim',                   { 'on': 'SudoWrite' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'melonmanchan/vim-tmux-resizer'
" Plug 'benmills/vimux', { 'on': 'VimuxRunCommand' }

call plug#end()

""" Plugin configurations

" fzf.vim override
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --hidden --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, <bang>0)

" use custom coc python lsp
let g:coc_user_config = {'python.jediEnabled': v:false}

" ale config
let g:ale_fixers = {'python': ['black', 'isort']}
let g:ale_linters = {'python': ['pylint', 'mypy']}
let g:ale_fix_on_save = 1
let g:ale_python_black_options = '-l 79'
let g:ale_python_mypy_options = '--no-strict-optional --disallow-untyped-defs --ignore-missing-imports'
