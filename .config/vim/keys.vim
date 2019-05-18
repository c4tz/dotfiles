" Commands
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :NERDTreeToggle<CR>

" Splits
nnoremap <Leader>. :vsplit<CR>
nnoremap <Leader>- :split<CR>
nnoremap <C-x> :q<CR>
nnoremap <C-G> <C-W>R
nnoremap <silent> <ESC>h :TmuxResizeLeft<cr>
nnoremap <silent> <ESC>l :TmuxResizeRight<cr>
nnoremap <silent> <ESC>j :TmuxResizeDown<cr>
nnoremap <silent> <ESC>k :TmuxResizeUp<cr>

" Tabularize shortcuts
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>t: :Tabularize /:\zs<CR>
vmap <Leader>t: :Tabularize /:\zs<CR>
nmap <Leader>t\ :Tabularize /\\<CR>
vmap <Leader>t\ :Tabularize /\\<CR>
