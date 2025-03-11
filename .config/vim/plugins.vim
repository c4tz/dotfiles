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
Plug 'fatih/vim-go',                            { 'do': ':GoUpdateBinaries' }
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp',                  { 'do': 'yay -S python-lsp-server'}
Plug 'sheerun/vim-polyglot'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }
Plug 'w0rp/ale'

" tmux stuff
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'RyanMillerC/better-vim-tmux-resizer'
Plug 'tmux-plugins/vim-tmux-focus-events'

call plug#end()

""" Plugin configurations

" fzf.vim override
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --hidden --line-number --no-heading --color=always --smart-case -g '!**/{.git,node_modules,vendor,.venv,.pyenv}/*' ".shellescape(<q-args>), 1, <bang>0)

" ale config
let g:ale_fixers = {'python': ['black', 'isort'], 'go': ['goimports', 'golines']}
let g:ale_linters = {'python': ['pylint', 'mypy']}
let g:ale_fix_on_save = 1
let g:ale_python_black_options = '-l 79'
let g:ale_python_mypy_options = '--no-strict-optional --disallow-untyped-defs --ignore-missing-imports'
let g:ale_go_golines_options = '-m 80'

" buffer autocomplete config
call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'allowlist': ['*'],
    \ 'blocklist': [],
    \ 'completor': function('asyncomplete#sources#buffer#completor')
    \ }))
