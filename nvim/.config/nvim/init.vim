let g:mapleader = "\<Space>"
let g:maplocalleader = "\<BS>"


call plug#begin('~/.config/nvim/plugins')
Plug 'liuchengxu/vim-which-key'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'arcticicestudio/nord-vim' 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'voldikss/vim-floaterm'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'wesQ3/vim-windowswap'
call plug#end()


set tabstop=8
set expandtab
set shiftwidth=4
set autoindent
set smartindent
set cindent       
set nu
set linebreak
set rnu
set foldmethod=indent
set foldnestmax=10
set foldlevel=2
set nofoldenable
set timeoutlen=500

colorscheme nord

" kinda sacreligious but saves some keystrokes
nnoremap s :w<CR>
" this makes escaping much eaier because j is in the home row
inoremap jj <ESC>


" Navigate through splits with Ctrl + hjkl because default split movements are shit
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" My leader keybindings witb WhichKey plugin added support
nnoremap <leader>f :FZF<CR>
nnoremap <leader>h :set hlsearch!<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFocus<CR>
nnoremap <leader>t :FloatermToggle<CR>
nnoremap <leader>r :so ~/.config/nvim/init.vim<CR>:echo 'Reloaded nvim'<CR>
nnoremap <leader>w :set wrap!<CR>
nnoremap <silent> <localleader> :WhichKey "\<BS\>"<CR>
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
let g:windowswap_map_keys = 0 " split swapper
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>


" find and replace <++> placeholders
inoremap <C-j> <ESC>/<++><CR><ESC>cf>
inoremap <C-k> <ESC>?<++><CR><ESC>cf>


"Move code block with alt jk
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> :m .+1<CR>==gi
inoremap <A-k> :m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


" Special localleader key binding for competitive programming with C++
autocmd filetype cpp nnoremap <LocalLeader>c :w <CR> :!g++ --std=c++11 -Wall %; if [ -f a.out ]; then echo \\n;time ./a.out; rm a.out; fi <CR>
autocmd filetype cpp let g:which_key_map_cpp={ 'c': 'Save, Compile and Run' }
autocmd filetype cpp call g:which_key#register("\<BS\>", "g:which_key_map_cpp")


" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif


" NerdTree size..
let g:NERDTreeWinSize=20

" lightline settings
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileencoding', 'filetype' ] ]
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }


" WhichKey notation for leader
let g:which_key_map={
    \ 'f': 'FZF',
    \ 'h': 'Toggle hlsearch',
    \ 'n': 'Toggle NerdTree',
    \ 'nf': 'NerdTree Focus',
    \ 't': 'FloatTerm',
    \ 'r' : 'Reload Nvim',
    \ 'w' : 'Toggle wrap',
    \ 'ww' : 'Yank/Paste Split',
    \ 'yw' : 'Yank Split',
    \ 'pw' : 'Paste Split'
    \ }
call g:which_key#register('<Space>', "g:which_key_map")
