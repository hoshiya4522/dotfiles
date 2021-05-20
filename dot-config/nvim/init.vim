let mapleader =" "


call plug#begin('~/.plugins/nvim')
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
"set foldmethod=indent


colorscheme nord
nnoremap s :w<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>t :FloatermToggle<CR>
nnoremap <leader>f :FZF<CR>
inoremap jj <ESC>

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
