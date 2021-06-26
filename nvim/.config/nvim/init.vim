let g:mapleader = "\<Space>"
let g:maplocalleader = ','


call plug#begin('~/.config/nvim/plugins')
Plug 'liuchengxu/vim-which-key'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'arcticicestudio/nord-vim' 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'voldikss/vim-floaterm'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
call plug#end()


set nu
set tabstop=2
set linebreak
set rnu
set foldmethod=indent
set foldnestmax=10
set foldlevel=2
set nofoldenable
set timeoutlen=500

colorscheme nord
nnoremap s :w<CR>
inoremap jj <ESC>

nnoremap <leader>f :FZF<CR>
nnoremap <leader>h :set hlsearch!<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>t :FloatermToggle<CR>
nnoremap <leader>r :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>w :set wrap!<CR>
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>


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

let g:which_key_map={
												\ 'f': 'FZF',
												\ 'h': 'Toggle hlsearch',
												\ 'n': 'NerdTree',
												\ 't': 'FloatTerm',
												\ 'r' : 'Reload Nvim',
												\ 'w' : 'Toggle wrap',
												\ }
call g:which_key#register('<Space>', "g:which_key_map")
