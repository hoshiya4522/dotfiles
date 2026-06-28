require("typst-preview").setup({
	-- This tells the plugin to use your existing Mason tinymist installation
	-- instead of downloading a separate binary.
	dependencies_bin = {
		["tinymist"] = "tinymist",
	},
})

vim.keymap.set("n", "<leader>tp", "<cmd>TypstPreviewToggle<CR>", { desc = "Toggle [T]ypst [P]review", silent = true })
