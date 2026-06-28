-- floating notification + manager
require('mini.notify').setup()

-- enhances the behaviour of {d, v, c ...} + a, i motions
require('mini.ai').setup()

-- Autopairs
require('mini.pairs').setup()

-- better surround actions like sa, sr, sd ...
require('mini.surround').setup()

-- Split and join arguments with gS
require('mini.splitjoin').setup()

-- bufferline (might replace later)
require('mini.tabline').setup({
	format = function(buf_id, label)
		local current_label = MiniTabline.default_format(buf_id, label)
		if vim.bo[buf_id].modified then
			-- only if modified
			return current_label .. ' '
		end
		return current_label
	end
})

-- statusline
require('mini.statusline').setup()

-- indent lines (replaced with indent-blankline)
-- require('mini.indentscope').setup()

-- completion engine (might replace with nvim-cmp or blink-cmp later)
-- require('mini.completion').setup({
-- 	lsp_completion = {
-- 		auto_setup = true,
-- 		process_items = function(items, base)
-- 			return require("mini.completion").default_process_items(items, base, {
-- 				filtersort = "fuzzy",
-- 			})
-- 		end,
-- 	}
-- })

-- snippet engine (Might replace with LuaSnip later)
-- require('mini.snippets').setup({
-- 	snippets = {
-- 		require('mini.snippets').gen_loader.from_lang(),
-- 	}
-- })
-- require('mini.snippets').start_lsp_server({ match = false })

