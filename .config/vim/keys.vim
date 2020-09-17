" Commands
imap kj <Esc>
nmap <C-p> :Files<CR>
nmap <Leader>p :FZFMru<CR>
nmap <C-b> :NERDTreeToggle<CR>
nmap <C-q> :q<CR>
imap <C-q> <ESC>:q<CR>
vmap <C-q> <ESC>:q<CR>
nmap <C-s> :w<CR>
imap <C-s> <ESC>:w<CR>
vmap <C-s> <ESC>:w<CR>gv
nmap <C-f> :Rg 
nmap <C-e> :e %<CR>
nmap <Leader>f :%s/foo/bar/g
nmap <Leader>F :! sed -i 's/pattern/replacement/' ./**
nmap s <Plug>(easymotion-overwin-f)
nmap <Leader>af :Autoformat<CR>

" Splits
nmap <Leader>- :split<CR>
nmap <Leader>. :vsplit<CR>
nmap <C-G> <C-W>R
nmap <silent> <ESC>h :TmuxResizeLeft<cr>
nmap <silent> <ESC>l :TmuxResizeRight<cr>
nmap <silent> <ESC>j :TmuxResizeDown<cr>
nmap <silent> <ESC>k :TmuxResizeUp<cr>

" Tabularize shortcuts
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>t: :Tabularize /:\zs<CR>
vmap <Leader>t: :Tabularize /:\zs<CR>
nmap <Leader>t\ :Tabularize /\\<CR>
vmap <Leader>t\ :Tabularize /\\<CR>

" fugitive shortcuts
noremap <Leader>gs :Gstatus<cr>
noremap <Leader>gc :Gcommit<cr>
noremap <Leader>ga :Gwrite<cr>
noremap <Leader>gl :Glog<cr>
noremap <Leader>gh :Glog<cr>
noremap <Leader>gd :Gdiff<cr>
noremap <Leader>gb :Gblame<cr>

" CamelCaseMotion
map w <Plug>CamelCaseMotion_w
map b <Plug>CamelCaseMotion_b
map e <Plug>CamelCaseMotion_e

" coc shortcuts
nmap <silent> gd <Plug>(coc-definition)
nmap <leader>rn <Plug>(coc-rename)
