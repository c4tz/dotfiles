" Commands
nmap <C-p> :Files<CR>
nmap <C-b> :NERDTreeToggle<CR>
nmap <C-q> :q<CR>
imap <C-q> <ESC>:q<CR>
vmap <C-q> <ESC>:q<CR>
nmap <C-s> :w<CR>
imap <C-s> <ESC>:w<CR>
vmap <C-s> <ESC>:w<CR>gv
nmap <C-f> :Rg 
nmap <C-h> :%s/foo/bar/g

" Splits
nmap <Leader>. :vsplit<CR>
nmap <Leader>- :split<CR>
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
