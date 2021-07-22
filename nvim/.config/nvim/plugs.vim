
call plug#begin('~/.config/plugins/nvim/')
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vimwiki/vimwiki'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'arcticicestudio/nord-vim' 
Plug 'morhetz/gruvbox'
Plug 'mbbill/undotree'
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

call plug#end()


so ~/.config/nvim/plug-conf/vlightline.vim
so ~/.config/nvim/plug-conf/v_startify.vim
so ~/.config/nvim/plug-conf/vcoc.vim
so ~/.config/nvim/plug-conf/vcommentary.vim
so ~/.config/nvim/plug-conf/vsnippets.vim
