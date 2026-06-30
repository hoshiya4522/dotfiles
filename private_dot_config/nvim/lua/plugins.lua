vim.pack.add({
	-- QoL Plugins
	{ src = 'https://github.com/nvim-mini/mini.nvim',                version = 'stable' },
	{ src = 'https://github.com/nvim-tree/nvim-web-devicons' },
	{ src = 'https://github.com/lukas-reineke/indent-blankline.nvim' },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/catgoose/nvim-colorizer.lua" },

	-- telescope
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },

	-- Themes
	{ src = 'https://github.com/vague-theme/vague.nvim' },
	{ src = 'https://github.com/folke/tokyonight.nvim' },
	{ src = 'https://github.com/ellisonleao/gruvbox.nvim' },

	-- LSP
	{ src = 'https://github.com/neovim/nvim-lspconfig' }, -- lsp configurations
	{ src = 'https://github.com/mason-org/mason.nvim' }, -- lsp installer

	-- autocomplete
	-- { src = "https://github.com/saghen/blink.cmp", branch = 'v1' }, -- completion engine plugin for neovim
	{ src = "https://github.com/saghen/blink.cmp" }, -- completion engine plugin for neovim
	{ src = "https://github.com/saghen/blink.lib" },

	-- Snippets
	{ src = 'https://github.com/L3MON4D3/LuaSnip' }, -- snippet engine
	{ src = 'https://github.com/rafamadriz/friendly-snippets' },

	-- treesitter
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter',    branch = 'main' },

	-- Editing
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/lervag/vimtex" },

	-- MISC
	{ src = "https://github.com/xeluxee/competitest.nvim" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" }, -- dependency for competitest
	{ src = "https://github.com/szymonwilczek/vim-be-better" },
})


-- configurations for each plugin
require("plugin_config.mini")
require("plugin_config.treesitter")
require("plugin_config.indent-blankline")
require("plugin_config.colorscheme") -- Colorscheme
require("plugin_config.typst-preview")
require("plugin_config.blink-cmp")
require("plugin_config.colorizer")
require("plugin_config.telescope")
require("plugin_config.luasnips") -- snippet engine
