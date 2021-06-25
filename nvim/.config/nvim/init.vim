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
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap s :w<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>t :FloatermToggle<CR>
nnoremap <leader>f :FZF<CR>
nnoremap <leader>s :so ~/.config/nvim/init.vim<CR>
inoremap jj <ESC>

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


