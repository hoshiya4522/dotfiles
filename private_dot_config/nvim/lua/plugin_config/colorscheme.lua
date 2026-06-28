require('vague').setup({
	-- Any other vague options you already have can stay here

	on_highlights = function(hl, colors)
		-- invert colors for better visibility
		hl.MiniTablineCurrent = { fg = colors.bg, bg = colors.fg, bold = true }
		hl.MiniTablineModifiedCurrent = { fg = colors.bg, bg = colors.floatBorder, bold = true }
	end
})

vim.cmd.colorscheme('vague')
