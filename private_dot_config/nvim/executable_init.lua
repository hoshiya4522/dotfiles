-- ──────────────────────────────────────────────────────────────────────
--  1. OPTIONS & GLOBALS
-- ──────────────────────────────────────────────────────────────────────
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = true
vim.o.linebreak = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.swapfile = false
vim.o.so = 7
vim.o.termguicolors = true
vim.o.inccommand = "split"
vim.opt.mouse = "nvc" -- Disable mouse in insert mode

-- ──────────────────────────────────────────────────────────────────────
--  2. PLUGINS (vim.pack)
-- ──────────────────────────────────────────────────────────────────────
vim.pack.add({
    -- UI & Core
    { src = "https://github.com/nvim-mini/mini.nvim" },
    { src = "https://github.com/folke/which-key.nvim" },
    { src = "https://github.com/lukas-reineke/indent-blankline.nvim", { main = "ibl" } },
    { src = "https://github.com/jiaoshijie/undotree" },
    { src = "https://github.com/stevearc/oil.nvim" },
    -- { src = "https://github.com/mluders/comfy-line-numbers.nvim" },

    -- LSP & Completion
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/williamboman/mason-lspconfig.nvim" },
    { src = "https://github.com/hrsh7th/nvim-cmp" },
    { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
    { src = "https://github.com/hrsh7th/cmp-buffer" },
    { src = "https://github.com/hrsh7th/cmp-path" },
    { src = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help" },

    -- Snippets
    { src = "https://github.com/L3MON4D3/LuaSnip" },
    { src = "https://github.com/saadparwaiz1/cmp_luasnip" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },

    -- Navigation
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2", name = "harpoon" },

    -- Syntax & Language Support
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "master" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/lervag/vimtex" },
    { src = "https://github.com/sevko/vim-nand2tetris-syntax" },
    { src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/preservim/vim-markdown" },
	{ src = "https://github.com/norcalli/nvim-colorizer.lua" },


    -- Colorscheme Pack
    { src = "https://github.com/rafi/awesome-vim-colorschemes" },
    { src = "https://github.com/folke/tokyonight.nvim"},

    -- Misc
	{ src = "https://github.com/ThePrimeagen/vim-be-good" },
	{
		src = "https://github.com/obsidian-nvim/obsidian.nvim",
		version = vim.version.range "*", -- use latest release, remove to use latest commit
	}
})

-- ──────────────────────────────────────────────────────────────────────
--  3. CORE UI & TOOLS CONFIG
-- ──────────────────────────────────────────────────────────────────────

-- Set your theme here (Try "dracula", "nord", "oceanic_next", or "moonfly")
vim.cmd.colorscheme("tokyonight")
-- vim.cmd.colorscheme("gruvbox")

-- Mini Modules
require("mini.statusline").setup()
require("mini.ai").setup()
require("mini.surround").setup()
require("mini.bracketed").setup()
require("mini.basics").setup()
require("mini.pairs").setup()
require("mini.tabline").setup()

-- Basic UI Plugins
require("ibl").setup()
require("undotree").setup()
require("oil").setup()
require'colorizer'.setup()
-- require("comfy-line-numbers").setup()

-- Treesitter
-- ──────────────────────────────────────────────────────────────────────
--  NEW TREESITTER CONFIGURATION (Kickstart Style)
-- ──────────────────────────────────────────────────────────────────────

-- 1. Install your everyday parsers upfront
local my_parsers = { 
    "bash", "c", "css", "go", "html", "java", "javascript", "json",
    "lua", "markdown", "markdown_inline", "python", "query", "rust",
    "tsx", "typescript", "typst", "vim", "vimdoc"
}
pcall(function()
    require('nvim-treesitter').install(my_parsers)
end)

-- Helper function to enable highlighting and indentation
---@param buf integer
---@param language string
local function treesitter_try_attach(buf, language)
    if not vim.treesitter.language.add(language) then return end

    -- Enable syntax highlighting
    pcall(vim.treesitter.start, buf, language)

    -- Check if treesitter indentation is available for this language
    local has_indent_query = vim.treesitter.query.get(language, 'indents') ~= nil
    if has_indent_query then 
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
end

-- 2. Smart Auto-Install and Attach
local available_parsers = require('nvim-treesitter').get_available()

vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
        local buf, filetype = args.buf, args.match
        local language = vim.treesitter.language.get_lang(filetype)
        if not language then return end

        local installed_parsers = require('nvim-treesitter').get_installed('parsers')

        if vim.tbl_contains(installed_parsers, language) then
            -- Enable the parser if it is already installed
            treesitter_try_attach(buf, language)
        elseif vim.tbl_contains(available_parsers, language) then
            -- Auto-install it and enable it after the installation is done
            require('nvim-treesitter').install(language):await(function()
                treesitter_try_attach(buf, language)
            end)
        else
            -- Try to enable features in case the parser exists but is not from `nvim-treesitter`
            treesitter_try_attach(buf, language)
        end
    end,
})



-- require("nvim-treesitter.configs").setup({
--     ensure_installed = {
--         "bash", "c", "css", "go", "html", "java", "javascript", "json",
--         "lua", "markdown", "markdown_inline", "python", "query", "rust",
--         "tsx", "typescript", "typst", "vim", "vimdoc"
--     },
--     sync_install = false,
--     auto_install = true,
--     highlight = { enable = true, additional_vim_regex_highlighting = false },
--     indent = { enable = true },
--     incremental_selection = {
--         enable = true,
--         keymaps = {
--             init_selection = "<C-space>",
--             node_incremental = "<C-space>",
--             scope_incremental = false,
--             node_decremental = "<bs>",
--         },
--     },
-- })

-- VimTeX
vim.g.vimtex_view_method = "sioyek"
vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_compiler_latexmk = {
    build_dir = "/tmp",
    options   = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "-outdir=/tmp" },
}
vim.g.vimtex_view_use_temp_files = 1
vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")


-- Typst Preview
require("typst-preview").setup({
    -- This tells the plugin to use your existing Mason tinymist installation
    -- instead of downloading a separate binary.
    dependencies_bin = {
        ["tinymist"] = "tinymist",
    },
})

-- render-markdown.nvim
require('render-markdown').setup({
	completions = { lsp = { enabled = true } },
})

-- Obsidian.nvim
-- require"obsidian".setup()

-- ──────────────────────────────────────────────────────────────────────
--  4. LSP & COMPLETION
-- ──────────────────────────────────────────────────────────────────────

require("mason").setup()
require("mason-lspconfig").setup({
    -- Tell Mason exactly what to auto-install
    ensure_installed = {
        "clangd",
        "cssls",
        "emmet_language_server",
        "eslint",
        "html",
        "jdtls",
        "jsonls",
        "lua_ls",
        "ruff",
        "tailwindcss",
        "texlab",
        "tinymist",
        "ts_ls",
        "ty",
    }
})

-- Lua LS Customization
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } },
            telemetry = { enable = false },
        },
    },
})

-- Enable Servers
vim.lsp.enable({
    "clangd",
    "cssls",
    "emmet_language_server",
    "eslint",
    "html",
    "jdtls",
    "jsonls",
    "lua_ls",
    "ruff",
    "tailwindcss",
    "texlab",
    "tinymist",
    "ts_ls",
    "ty"
})
-- vim.lsp.config("jdtls", {
--     root_dir = function(bufnr, on_dir)
--         local fname = vim.api.nvim_buf_get_name(bufnr)
--         local root = vim.fs.root(fname, { "pom.xml", "build.gradle", ".git" })
--         -- Use the project root if found, otherwise fallback to the single file's folder
--         on_dir(root or vim.fs.dirname(fname))
--     end,
-- })




-- Diagnostics UI
vim.diagnostic.config({
    virtual_text = { prefix = "●", spacing = 4 },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = { border = "rounded" },
})

-- Diagnostic Icons
local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, { focus = false })
    end,
})

-- Inlay hints (Buffer-local toggle)
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspAttach_inlayhints", {}),
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.inlayHintProvider then
            vim.keymap.set("n", "<leader>th", function()
                local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf })
                vim.lsp.inlay_hint.enable(not enabled, { bufnr = event.buf })
                print(enabled and "Hints disabled" or "Hints enabled")
            end, { buffer = event.buf, desc = "LSP: Toggle Inlay Hints" })

            vim.lsp.inlay_hint.enable(false, { bufnr = event.buf })
        end
    end,
})

-- Completion (Cmp & LuaSnip)
local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load({
    paths = { vim.fn.expand("~/.config/nvim/snippets/") },
})

luasnip.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = false, -- Default changed to OFF
    region_check_events = "CursorMoved",
    delete_check_events = "TextChanged",
})

-- Lag-Free LuaSnip Auto-Accept Toggle
local expand_autosnippets_orig = luasnip.expand_auto
local nop = function() end

luasnip.expand_auto = nop
local autosnippets_enabled = false

-- vim.keymap.set({ "n", "i", "s" }, "<leader>ta", function()
vim.keymap.set({ "n", "s" }, "<leader>ta", function()
    autosnippets_enabled = not autosnippets_enabled
    if autosnippets_enabled then
        luasnip.expand_auto = expand_autosnippets_orig
        print("LuaSnip Auto-Accept: ON")
    else
        luasnip.expand_auto = nop
        print("LuaSnip Auto-Accept: OFF")
    end
end, { desc = "Toggle LuaSnip Auto-Accept", silent = true })


cmp.setup({
    snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
    mapping = {
        ["<C-Space>"] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.mapping.scroll_docs(4)() else cmp.complete() end
        end, { "i", "c" }),
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-k>"] = cmp.mapping(vim.lsp.buf.signature_help, { "i", "s" }),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-l>"] = cmp.mapping(function() if luasnip.jumpable(1) then luasnip.jump(1) end end, { "i", "s" }),
        ["<C-h>"] = cmp.mapping(function() if luasnip.jumpable(-1) then luasnip.jump(-1) end end, { "i", "s" }),
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
        { name = "nvim_lsp_signature_help" },
    }),
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        fields = { "abbr", "menu", "kind" },
        format = function(entry, vim_item)
            local menus = { nvim_lsp = "[LSP]", luasnip = "[Snip]", buffer = "[Buf]", path = "[Path]" }
            vim_item.menu = menus[entry.source.name]
            return vim_item
        end,
    },
})

-- ──────────────────────────────────────────────────────────────────────
--  5. KEYMAPS & BEHAVIOR
-- ──────────────────────────────────────────────────────────────────────

local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { desc = desc, silent = true })
end

-- General
map("n", "<Esc>", "<cmd>nohlsearch<CR>", "Clear search highlight")
map("i", "jk", "<Esc>", "Quick escape")
map("n", "S", ":w<CR>", "Save file")
map({"n", "v", "x"}, ";", ":")

-- Clipboard
map("n", "<leader>cf", "mmggVG\"+yg'm", "Copy entire file")
map("v", "<leader>y", '"+y', "Copy to clipboard")
map("n", "<leader>y", '"+yy', "Copy line to clipboard")
map("n", "<leader>p", '"+p', "Paste from clipboard")

-- Emacs-style insert nav
map("i", "<C-a>", "<C-o>_", "Move to start of line")
map("i", "<C-e>", "<C-o>$", "Move to end of line")

-- Move lines
map("n", "<A-j>", ":m .+1<CR>==", "Move line down")
map("n", "<A-k>", ":m .-2<CR>==", "Move line up")
map("i", "<A-j>", "<ESC>:m .+1<CR>==gi", "Move line down")
map("i", "<A-k>", "<ESC>:m .-2<CR>==gi", "Move line up")
map("v", "<A-j>", ":m '>+1<CR>gv=gv", "Move selection down")
map("v", "<A-k>", ":m '<-2<CR>gv=gv", "Move selection up")

-- Toggles
map("n", "<leader>u", require("undotree").toggle, "Toggle Undotree")
map("n", "<leader>fo", function()
    local oil = require("oil")
    if vim.bo.filetype == "oil" then oil.close() else oil.open() end
end, "Toggle Oil")

-- LSP
map("n", "<leader>d", vim.diagnostic.open_float, "LSP: Show diagnostics")
map("n", "[d", vim.diagnostic.goto_prev, "LSP: Previous diagnostic")
map("n", "]d", vim.diagnostic.goto_next, "LSP: Next diagnostic")
map("n", "<leader>ld", require("telescope.builtin").diagnostics, "LSP: List diagnostics")
map("n", "<leader>rn", vim.lsp.buf.rename, "LSP: Rename")
map({ "n", "x" }, "gra", vim.lsp.buf.code_action, "LSP: Goto Code Action")
map("n", "grr", require("telescope.builtin").lsp_references, "LSP: Goto References")
map("n", "gri", require("telescope.builtin").lsp_implementations, "LSP: Goto Implementation")
map("n", "grd", require("telescope.builtin").lsp_definitions, "LSP: Goto Definition")
map("n", "grD", vim.lsp.buf.declaration, "LSP: Goto Declaration")
map("n", "gO", require("telescope.builtin").lsp_document_symbols, "LSP: Document Symbols")
map("n", "gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "LSP: Workspace Symbols")
map("n", "grt", require("telescope.builtin").lsp_type_definitions, "LSP: Goto Type Definition")

-- Harpoon
local harpoon = require("harpoon")
harpoon:setup()
map("n", "<leader>a", function() harpoon:list():add() end, "Add to harpoon list")
map("n", "<leader>h", function() harpoon:list():select(1) end, "Go to Harpoon 1")
map("n", "<leader>j", function() harpoon:list():select(2) end, "Go to Harpoon 2")
map("n", "<leader>k", function() harpoon:list():select(3) end, "Go to Harpoon 3")
map("n", "<C-S-P>", function() harpoon:list():prev() end, "Harpoon previous")
map("n", "<C-S-N>", function() harpoon:list():next() end, "Harpoon next")

-- Telescope
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, "Telescope find files")
map("n", "<leader>fg", builtin.live_grep, "Telescope live grep")
map("n", "<leader>fb", builtin.buffers, "Telescope buffers")
map("n", "<leader>fh", builtin.help_tags, "Telescope help tags")
map("n", "<leader><leader>", builtin.buffers, "Telescope buffers")

-- Harpoon + Telescope Integration
local conf = require("telescope.config").values
map("n", "<C-e>", function()
    local file_paths = {}
    for _, item in ipairs(harpoon:list().items) do
        table.insert(file_paths, item.value)
    end
    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({ results = file_paths }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end, "Open harpoon window")

-- Which-Key
require("which-key").add({
    { "<leader>f", group = "file" },
    { "<leader>fn", desc = "New File" },
    { "<leader>f1", hidden = true },
    { "<leader>w", proxy = "<c-w>", group = "windows" },
    { "<leader>b", group = "buffers", expand = function() return require("which-key.extras").expand.buf() end },
})

-- typst
map("n", "<leader>tp", "<cmd>TypstPreviewToggle<CR>", "Toggle [T]ypst [P]review")
