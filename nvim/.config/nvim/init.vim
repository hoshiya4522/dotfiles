let g:mapleader = "\<Space>"
let g:maplocalleader = "\<BS>"


call plug#begin('~/.config/nvim/plugins')
Plug 'mhinz/vim-startify'
Plug 'liuchengxu/vim-which-key'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'arcticicestudio/nord-vim' 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'chrisbra/colorizer'
Plug 'voldikss/vim-floaterm'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'wesQ3/vim-windowswap'
Plug 'mbbill/undotree'
call plug#end()


set exrc
set tabstop=4 softtabstop=0 noexpandtab
"set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set autoindent
set smartindent
set cindent
set nu
set rnu
set wrap
set linebreak
set nohlsearch
set incsearch
set smartcase
set ignorecase
set showtabline=2
set noswapfile
set foldmethod=indent
set foldnestmax=10
set foldlevel=2
set fillchars=fold: 
hi Folded ctermfg=grey ctermbg=black cterm=italic gui=italic guibg=none guifg=#696969
set nofoldenable
set timeoutlen=300
set signcolumn=yes
set cmdheight=1	

set nobackup
set undodir=~/.config/nvim/undodir
set undofile

colorscheme nord

" this makes escaping much eaier because j is in the home row
inoremap jk <ESC>


" Navigate through splits with Ctrl + hjkl because default split movements are shit
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l

nnoremap s :w<CR>

" My leader keybindings witb WhichKey plugin added support
nnoremap <leader>f :FZF<CR>
nnoremap <leader>h :set hlsearch!<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFocus<CR>
nnoremap <leader>c1 :colorscheme nord<CR>
nnoremap <leader>c2 :colorscheme gruvbox<CR>
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
nnoremap <BS><Space> <ESC>/<++><CR><ESC>cf>


"Move code block with alt jk
nnoremap <A-j> :m .+1<CR>==zz
nnoremap <A-k> :m .-2<CR>==zz
inoremap <A-j> <ESC>:m .+1<CR>zz==gi
inoremap <A-k> <ESC>:m .-2<CR>zz==gi
vnoremap <A-j> :m '>+1<CR>gv=gvzz
vnoremap <A-k> :m '<-2<CR>gv=gvzz


" Special localleader key binding for competitive programming with C++
autocmd filetype cpp nnoremap <LocalLeader>c :w <CR> :!g++ --std=c++11 -Wall %; if [ -f a.out ]; then echo \\n;time ./a.out; rm a.out; fi <CR>
autocmd filetype cpp let g:which_key_map_cpp={ 'c': 'Save, Compile and Run' }
autocmd filetype cpp call g:which_key#register("\<BS\>", "g:which_key_map_cpp")

autocmd filetype cpp set foldmethod=marker
autocmd filetype cpp set foldmarker={,}


" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif


" NerdTree size..
let g:NERDTreeWinSize=20

" lightline settings
let g:lightline = {
    \ 'colorscheme': 'nord',
    \ 'active': {
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent' ],
    \              [ 'fileencoding', 'filetype' ] ]
    \ },
    \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
    \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
	\ }

let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[Empty Buffer]'
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

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


" Functions
function! MyFoldText()
    let nl = v:foldend - v:foldstart + 1

    let txt =  '└ ' . nl . ' Lines folded '

    return txt
endfunction
set foldtext=MyFoldText()


let g:startify_lists = [
    \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
    \ { 'type': 'files',     'header': ['   Files']            },
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
    \ ]



let g:startify_custom_header = [
    \ ' _   ___     _____ __  __ ',
    \ '| \ | \ \   / /_ _|  \/  |',
    \ '|  \| |\ \ / / | || |\/| |',
    \ '| |\  | \ V /  | || |  | |',
    \ '|_| \_|  \_/  |___|_|  |_|',
    \]



"so ~/.config/nvim/plug-conf/vcoc.vim
