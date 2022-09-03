vim.cmd('highlight Visual cterm=reverse gui=reverse ctermbg=NONE guibg=NONE')
vim.cmd('source ~/.config/nvim/idkLua.vim')
-- vim.cmd('set mouse=a')


vim.g.autoread = true
vim.g.ignorecase = true
vim.g.cmdheight = 2
vim.wo.cursorline = true
vim.wo.cursorcolumn = true
vim.wo.linebreak = true
vim.wo.wrap = true
vim.wo.scrolloff = 4
vim.g.nobackup = true
vim.g.undofile = true
vim.g.undodir = "~/.config/nvim/undodir"
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.g.termguicolors = true
vim.wo.rnu = true
vim.wo.nu = true
vim.g.mapleader = ' '
vim.g.maplocalleader = "<BS>"

vim.g.tokyonight_style = "night"

require('packer').startup(function()

	--lsp
	use "neovim/nvim-lspconfig" -- enable LSP
	use "williamboman/nvim-lsp-installer" -- simple to use language server installer
	use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for

	-- completion
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use "saadparwaiz1/cmp_luasnip" -- snippet completions
	use "L3MON4D3/LuaSnip" --snippet engine
	use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

	use 'mattn/emmet-vim'
	use 'preservim/nerdtree'
	use 'tiagofumo/vim-nerdtree-syntax-highlight'
	use 'ryanoasis/vim-devicons'
	use 'PhilRunninger/nerdtree-visual-selection'
	use 'wbthomason/packer.nvim'
	use 'elkowar/yuck.vim'
	use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
	use 'jiangmiao/auto-pairs'
	use 'tpope/vim-surround'
	use 'tpope/vim-commentary'
	use 'arcticicestudio/nord-vim'
	use 'folke/tokyonight.nvim'
	use 'mbbill/undotree'
	use 'morhetz/gruvbox'
	use 'wesQ3/vim-windowswap'
	use 'nvim-lua/plenary.nvim'

	use 'nvim-telescope/telescope.nvim'
        use {
	      'nvim-lualine/lualine.nvim',
	      requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}
end)

vim.cmd('colorscheme tokyonight')





local bindkey = vim.api.nvim_set_keymap
local nnr = { noremap = true }

bindkey("i", "<C-e>", '<ESC>:call emmet#expandAbbr(3,"")<CR>i', nnr)
bindkey("n", "<Leader>e", ':call emmet#expandAbbr(3,"")<CR>', nnr)
bindkey("n", "<A-1>", ":BufferLineGoToBuffer 1<CR>", nnr)
bindkey("n", "<A-2>", ":BufferLineGoToBuffer 2<CR>", nnr)
bindkey("n", "<A-3>", ":BufferLineGoToBuffer 3<CR>", nnr)
bindkey("n", "<A-4>", ":BufferLineGoToBuffer 4<CR>", nnr)
bindkey("n", "<A-5>", ":BufferLineGoToBuffer 5<CR>", nnr)
bindkey("n", "<A-6>", ":BufferLineGoToBuffer 6<CR>", nnr)
bindkey("n", "<A-7>", ":BufferLineGoToBuffer 7<CR>", nnr)
bindkey("n", "<A-8>", ":BufferLineGoToBuffer 8<CR>", nnr)
bindkey("n", "<A-9>", ":BufferLineGoToBuffer 9<CR>", nnr)
bindkey("n", "<A-0>", ":BufferLineGoToBuffer 10<CR>", nnr)
bindkey("i", "jk", "<ESC>", nnr)
bindkey("n", "ZB", ":bdelete<CR>", nnr)
bindkey("n", "Y", "y$", nnr)
bindkey("n", "<Leader>w", ":set wrap!<CR>", nnr)
bindkey("n", "s", ":w<CR>", nnr)
bindkey("n", "<Leader>n", ':NERDTreeToggle<CR>', nnr)
bindkey("n", "<Leader>f", ':NERDTreeFocus<CR>', nnr)
bindkey("n", "<Leader>h", ':set hlsearch!<CR>', nnr)
bindkey("n", "<Leader>y", '"+y', nnr)
bindkey("v", "<Leader>y", '"+y', nnr)
bindkey("n", "<Leader>p", '"+p', nnr)
bindkey("n", "<Leader>r", ":so ~/.config/nvim/init.lua<CR>:echo 'Reloaded nvim'<CR>", nnr)
bindkey("i", "<C-h>", "<C-w>h", nnr)
bindkey("i", "<C-j>", "<C-w>j", nnr)
bindkey("i", "<C-k>", "<C-w>k", nnr)
bindkey("i", "<C-l>", "<C-w>l", nnr)
bindkey("n", "<C-h>", "<C-w>h", nnr)
bindkey("n", "<C-j>", "<C-w>j", nnr)
bindkey("n", "<C-k>", "<C-w>k", nnr)
bindkey("n", "<C-l>", "<C-w>l", nnr)
bindkey("v", "<C-h>", "<C-w>h", nnr)
bindkey("v", "<C-j>", "<C-w>j", nnr)
bindkey("v", "<C-k>", "<C-w>k", nnr)
bindkey("v", "<C-l>", "<C-w>l", nnr)
bindkey("n", "<A-j>", ":m .+1<CR>==", nnr)
bindkey("n", "<A-k>", ":m .-2<CR>==", nnr)
bindkey("i", "<A-j>", "<ESC>:m .+1<CR>==gi", nnr)
bindkey("i", "<A-k>", "<ESC>:m .-2<CR>==gi", nnr)
bindkey("v", "<A-j>", ":m '>+1<CR>gv=gv", nnr)
bindkey("v", "<A-k>", ":m '<-2<CR>gv=gv", nnr)
bindkey("n", "<C-A-h>", "<C-w><", nnr)
bindkey("n", "<C-A-j>", "<C-w>-", nnr)
bindkey("n", "<C-A-k>", "<C-w>+", nnr)
bindkey("n", "<C-A-l>", "<C-w>>", nnr)


vim.opt.termguicolors = true

require('bufferline').setup {}

require "user.cmp"
require "user.lualine"
require "user.lsp"
