""" Plugin list
call plug#begin()

" theming
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" git stuff
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin',             { 'on': 'NERDTreeToggle' }

" navigaton
Plug 'bkad/CamelCaseMotion'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree',                     { 'on': 'NERDTreeToggle' }

" misc
Plug 'airblade/vim-rooter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'chrisbra/SudoEdit.vim',                   { 'on': 'SudoWrite' }
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'

" syntax, format, linting & autocompletion
Plug 'Chiel92/vim-autoformat'
Plug 'deoplete-plugins/deoplete-jedi',          { 'do': 'yay -S python-jedi'}
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim',                    { 'do': 'yay -S python-pynvim'}
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }
Plug 'w0rp/ale'

" tmux stuff
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'RyanMillerC/better-vim-tmux-resizer'
Plug 'tmux-plugins/vim-tmux-focus-events'
" Plug 'benmills/vimux', { 'on': 'VimuxRunCommand' }

call plug#end()

""" Plugin configurations

" fzf.vim override
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --hidden --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, <bang>0)

" ale config
let g:ale_fixers = {'python': ['black', 'isort']}
let g:ale_linters = {'python': ['pylint', 'mypy']}
let g:ale_fix_on_save = 1
let g:ale_python_black_options = '-l 79'
let g:ale_python_mypy_options = '--no-strict-optional --disallow-untyped-defs --ignore-missing-imports'

" deoplete config
let g:deoplete#enable_at_startup = 1
