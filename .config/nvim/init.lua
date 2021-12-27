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
-- nnoremap <C-h> <C-w><
-- nnoremap <C-j> <C-w>-
-- nnoremap <C-k> <C-w>+
-- nnoremap <C-l> <C-w>>


require('packer').startup(function()
	use 'mattn/emmet-vim'
	use 'preservim/nerdtree'
	use 'tiagofumo/vim-nerdtree-syntax-highlight'
	use 'ryanoasis/vim-devicons'
	use 'PhilRunninger/nerdtree-visual-selection'
	use 'scrooloose/nerdtree-project-plugin'
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
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	-- use 'nvim-lua/completion-nvim'
	use 'hrsh7th/nvim-compe'
	use 'nvim-telescope/telescope.nvim'
        use {
	      'nvim-lualine/lualine.nvim',
	      requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}
	-- use {
	-- 	'kyazdani42/nvim-tree.lua',
	-- 	requires = {
	-- 	  'kyazdani42/nvim-web-devicons', -- optional, for file icon
	-- 	},
	-- 	config = function() require'nvim-tree'.setup {} end
	-- }
end)

vim.opt.termguicolors = true

require('bufferline').setup {}


-- lsp stuff
-- require'lspconfig'.pyright.setup{}
-- require'lspconfig'.tsserver.setup{}
 


vim.g.tokyonight_style = "night"
vim.g.colors_name = 'tokyonight'
-- vim.g.colors_name = 'nord'

-- require'lspconfig'.pyright.setup{}
-- require'lspconfig'.tsserver.setup{}


--------------------
-- Lualine Config --
-- -----------------
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '\\', right = '/'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff',
                  {'diagnostics', sources={'nvim_lsp', 'coc'}}},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}






-------------------------------
-- nvim-lsp-installer config --
-- ----------------------------
local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)





----------------
-- Nvim-Compe --
-- -------------
vim.o.completeopt = "menuone,noselect"
require'compe'.setup {
	enabled = true;
	autocomplete = true;
	debug = false;
	min_length = 1;
	preselect = 'enable';
	throttle_time = 80;
	source_timeout = 200;
	incomplete_delay = 400;
	max_abbr_width = 100;
	max_kind_width = 100;
	max_menu_width = 100;
	documentation = true;

	source = {
		path = true;
		buffer = true;
		calc = true;
		vsnip = true;
		nvim_lsp = true;
		nvim_lua = true;
		spell = true;
		tags = true;
		snippets_nvim = true;
		treesitter = true;
	};
}
local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
	local col = vim.fn.col('.') - 1
	if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
		return true
	else
		return false
	end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t "<C-n>"
	elseif vim.fn.call("vsnip#available", {1}) == 1 then
		return t "<Plug>(vsnip-expand-or-jump)"
	elseif check_back_space() then
		return t "<Tab>"
	else
		return vim.fn['compe#complete']()
	end
end
_G.s_tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t "<C-p>"
	elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
		return t "<Plug>(vsnip-jump-prev)"
	else
		-- If <S-Tab> is not working in your terminal, change it to <C-h>
		return t "<S-Tab>"
	end
end



require'lspconfig'.arduino_language_server.setup{}

-- lspconfig.arduino_language_server.setup({
-- 	cmd =  {
-- 		-- Required
-- 		"arduino-language-server",
-- 		"-cli-config", "/path/to/arduino-cli.yaml",
-- 	}
-- })



-- vim.cmd('source ~/.config/nvim/tree.lua')
