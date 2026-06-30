local ls = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
-- check blink-cmp.lua for keybinds



-- for now tab is next sel and shift tab is prev

-- Expand or jump forward in snippet (Tab)
-- vim.keymap.set({ "i", "s" }, "<C-l>", function()
-- 	if ls.expand_or_jumpable() then
-- 		ls.expand_or_jump()
-- 	else
-- 		vim.notify("Can't expand nor jump")
-- 	end
-- end, { expr = true, silent = true })
--
-- vim.keymap.set({ "i", "s" }, "<C-h>", function()
-- 	if ls.jumpable(-1) then
-- 		ls.jump(-1)
-- 	else
-- 		vim.notify("Can't jump")
-- 	end
-- end, { silent = true })
