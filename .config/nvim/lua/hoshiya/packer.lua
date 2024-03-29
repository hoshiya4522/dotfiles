vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use('mbbill/undotree')

    -- Fuzzy finders
    use('ThePrimeagen/harpoon')
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- colorschemes
    use('folke/tokyonight.nvim')
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')

    -- Git stuff
    use('tpope/vim-fugitive')

    -- surround and completions
    use('tpope/vim-surround')
    use('jiangmiao/auto-pairs')
    use('mattn/emmet-vim')

    -- multi-cursors
    use 'mg979/vim-visual-multi'

    -- StatusLine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    require('lualine').setup{
        options = { theme = 'tokyonight' }
    }

    -- something?
    use 'ThePrimeagen/vim-be-good'

    -- LSP and stuff
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

end)

