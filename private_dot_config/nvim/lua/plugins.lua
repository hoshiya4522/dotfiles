vim.pack.add({
	-- QoL Plugins
	{ src = 'https://github.com/nvim-mini/mini.nvim',                version = 'stable' },
	{ src = 'https://github.com/folke/snacks.nvim' },
	{ src = 'https://github.com/nvim-tree/nvim-web-devicons' },
	{ src = 'https://github.com/lukas-reineke/indent-blankline.nvim' },
	{ src = "https://github.com/folke/which-key.nvim" },

	-- Themes
	{ src = 'https://github.com/vague-theme/vague.nvim' },
	{ src = 'https://github.com/folke/tokyonight.nvim' },
	{ src = 'https://github.com/folke/tokyonight.nvim' },
	{ src = 'https://github.com/ellisonleao/gruvbox.nvim' },

	-- Snippets
	{ src = 'https://github.com/rafamadriz/friendly-snippets' },

	-- LSP
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = 'https://github.com/mason-org/mason.nvim' },

	-- treesitter
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter',    branch = 'main' },

	-- Editing
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/lervag/vimtex" },

	-- MISC
	{ src = "https://github.com/xeluxee/competitest.nvim" },
	{ src = "https://github.com/szymonwilczek/vim-be-better" },
})


-- configurations for each plugin
-- require("plugin_config.snacks")
require("plugin_config.mini")
require("plugin_config.treesitter")
require("plugin_config.indent-blankline")
require("plugin_config.colorscheme") -- Colorscheme
require("plugin_config.typst-preview")
