require("mason").setup({})

-- generates a default list of all the LSP features
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- merge native capabilities with mini.completion capabilities (in the case of conflict, prioritize mini completion)
-- local merged_capabilities = vim.tbl_deep_extend("force", capabilities, require("mini.completion").get_lsp_capabilities())

-- merge native capabilities with blink-cmp capabilities (in the case of conflict, prioritize mini completion)
local merged_capabilities = vim.tbl_deep_extend('force', capabilities,
	require('blink.cmp').get_lsp_capabilities({}, false))

-- Configurations.
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
		},
	},
})

vim.lsp.config("ty", {
	-- from gemini
	root_dir = function(bufnr)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		local project_root = vim.fs.root(bufnr, { '.git', 'pyproject.toml', 'requirements.txt' })
		return project_root or vim.fs.dirname(fname)
	end,
})

vim.diagnostic.config({
	virtual_text = true,
	-- update_in_insert = true
})


vim.lsp.config("*", { capabilities = merged_capabilities })
vim.lsp.enable({
	-- C/C++
	"clangd",

	-- web
	"cssls", "tailwindcss",
	"emmet_language_server", "html",
	"eslint", "ts_ls",
	"jsonls",

	"jdtls",

	"bash-language-server",

	"texlab", -- LSP for LaTeX
	"tinymist", -- LSP for Typst

	"lua_ls",

	-- python
	"ruff", -- Python linter and code formatter
	"ty" -- Python type checker and language server
})

-- LSP Keybinds
vim.keymap.set("n", "<leader>=", vim.lsp.buf.format, { desc = "Format local buffer", silent = true })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[g]oto [d]efinition", silent = true })
vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float,
	{ desc = "Open [d]iagnostics [f]loat window", silent = true })


-- These GLOBAL keymaps are created unconditionally when Nvim starts:
-- "gra" (Normal and Visual mode) is mapped to vim.lsp.buf.code_action()
-- "gri" is mapped to vim.lsp.buf.implementation()
-- "grn" is mapped to vim.lsp.buf.rename()
-- "grr" is mapped to vim.lsp.buf.references()
-- "grt" is mapped to vim.lsp.buf.type_definition()
-- "grx" is mapped to vim.lsp.codelens.run()
-- "gO" is mapped to vim.lsp.buf.document_symbol()
-- CTRL-S (Insert mode) is mapped to vim.lsp.buf.signature_help()
