-- for v2
local cmp = require('blink.cmp')
cmp.build():pwait()
cmp.setup()

-- for v1
-- require("blink.cmp").setup({
-- 	keymap = { preset = "default" },
--
-- 	appearance = {
-- 		nerd_font_variant = "mono",
-- 	},
--
-- 	completion = {
-- 		documentation = { auto_show = true }
-- 	},
--
-- 	snippets = {
-- 		preset = "luasnip",
-- 	},
--
-- 	sources = {
-- 		default = { "lsp", "path", "snippets", "buffer" },
-- 	},
--
--         fuzzy = { implementation = "lua" }
-- })
