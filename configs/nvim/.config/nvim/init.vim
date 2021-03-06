let g:mapleader = "\<Space>"
let g:maplocalleader = "\<BS>"

set termguicolors

" Plugins
call plug#begin('~/.config/plugins/nvim/')
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vimwiki/vimwiki'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'elkowar/yuck.vim'

Plug 'arcticicestudio/nord-vim' 
Plug 'Rigellute/shades-of-purple.vim'

Plug 'mbbill/undotree'
Plug 'honza/vim-snippets'
Plug 'chrisbra/colorizer'

Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'scrooloose/nerdtree-project-plugin'

Plug 'wesQ3/vim-windowswap'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()


" set showtabline=2
so ~/.config/nvim/plug-conf/vairline.vim
so ~/.config/nvim/plug-conf/v_startify.vim
so ~/.config/nvim/plug-conf/vcoc.vim
so ~/.config/nvim/plug-conf/vcommentary.vim
so ~/.config/nvim/plug-conf/vsnippets.vim

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

set cmdheight=2
set cursorline
set cursorcolumn
set exrc
"set tabstop=4 softtabstop=0 noexpandtab
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line
"set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set autoindent
set autoread
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
set noswapfile
set foldmethod=indent
set foldnestmax=10
set foldlevel=2
set fillchars=fold: 
" hi Folded ctermfg=grey ctermbg=black cterm=italic gui=italic guibg=none guifg=#696969
set nofoldenable
" set timeoutlen=300
set signcolumn=yes
set cmdheight=1	
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set scrolloff=4

" colorscheme nord
colorscheme shades_of_purple
" colorscheme gruvbox

" this makes escaping much eaier because j is in the home row
inoremap jk <ESC>


" Buffer navigation
nnoremap ZB :bdelete<CR>
nnoremap <TAB> :w<CR>:bn<CR>
nnoremap <S-TAB> :w<CR>:bp<CR>

" Navigate through splits with Ctrl + hjkl because default split movements are shit
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l

nnoremap <C-h> <C-w><
nnoremap <C-j> <C-w>-
nnoremap <C-k> <C-w>+
nnoremap <C-l> <C-w>>

nnoremap s :w<CR>
nnoremap S :w<CR>

nnoremap Y y$

nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>y "+y
vnoremap <leader>y "+y

nnoremap <leader>e :call emmet#expandAbbr(3,"")<CR>

nnoremap <leader>h :set hlsearch!<CR>
nnoremap <leader>t :Telescope git_files <CR>
nnoremap <leader>f :Telescope find_files<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFocus<CR>
nnoremap <leader>c1 :colorscheme nord<CR>
nnoremap <leader>r :so ~/.config/nvim/init.vim<CR>:echo 'Reloaded nvim'<CR>
nnoremap <leader>w :set wrap!<CR>
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
autocmd filetype cpp nnoremap <LocalLeader>t :wa <CR> :![ -e a.out ] && rm a.out; echo "\nCompiling..."; g++ --std=c++11 -Wall main.cxx && echo "Compiled ✓\n" && time ( timeout 8 ./a.out<input ) <CR>

nnoremap <LocalLeader>d :wa <CR> :silent ![ -e a.out ] && rm a.out; echo "\nCompiling..."; g++ --std=c++14 -Wall main.cxx && echo "Compiled ✓\n" && time ( timeout 8 ./a.out<input>output ) <CR>

" Here in stands for input eg. input.in 
" autocmd filetype in set autoread
" autocmd filetype in au CursorHold * checktime

" Here op stands for output eg. output.op
" autocmd filetype op set autoread                                                                                                                                                                       
" autocmd filetype op au CursorHold * checktime

autocmd filetype cpp set foldmethod=marker
autocmd filetype cpp set foldmarker={,}


" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif


" NerdTree size..
let g:NERDTreeWinSize=26


" Functions
function! MyFoldText()
    let nl = v:foldend - v:foldstart + 1

    let txt =  '└ ' . nl . ' Lines folded '

    return txt
endfunction
set foldtext=MyFoldText()


