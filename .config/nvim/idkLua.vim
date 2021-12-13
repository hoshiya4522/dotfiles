set noswapfile
set nobackup
set title
set ignorecase


" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * if &filetype !=# 'man' | NERDTree | endif | wincmd p 
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" NerdTree size..
let g:NERDTreeWinSize=24



nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" auto-format
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)


" Bufferline Setup
nnoremap <silent><TAB> :BufferLineCycleNext<CR>
nnoremap <silent><S-TAB> :BufferLineCyclePrev<CR>
nnoremap <silent><Leader>` :BufferLineMoveNext<CR>
nnoremap <silent><Leader>~ :BufferLineMovePrev<CR>
nnoremap <silent><Leader>b :bd<CR>

highlight Visual cterm=reverse gui=reverse ctermbg=NONE guibg=NONE


"compe
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })



" Competitive Programming cpp stuff
let g:maplocalleader = "\<BS>"
set autoread
nnoremap <LocalLeader>c :w <CR> :!g++ --std=c++11 -Wall main.cpp; if [ -f a.out ]; then echo \\n;time ./a.out; rm a.out; fi <CR>
nnoremap <LocalLeader>t :wa <CR> :![ -e a.out ] && rm a.out; echo "\nCompiling..."; g++ --std=c++11 -Wall main.cxx && echo "Compiled ✓\n" && time ( timeout 8 ./a.out<input ) <CR>
nnoremap <LocalLeader>d :wa <CR> :silent ![ -e a.out ] && rm a.out; echo "\nCompiling..."; g++ --std=c++14 -Wall main.cxx && echo "Compiled ✓\n" && time ( timeout 8 ./a.out<input>output ) <CR>



autocmd BufWritePost ~/Git/dwm/config.h !cd ~/Git/dwm/ ; sudo make install 
autocmd BufWritePost ~/Git/dmenu/config.h !cd ~/Git/dmenu ; sudo make install 
autocmd BufWritePost ~/Git/dwm/dwmblocks/config.h !cd ~/Git/dwm/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid dwmblocks & }
