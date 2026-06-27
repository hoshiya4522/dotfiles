vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function map(mode, map_from, map_to, desc)
    vim.keymap.set(mode, map_from, map_to, { desc = desc, silent = true })
end

map("i", "jk", "<Esc>", "Quick escape")
map("n", "S", ":w<CR>", "Save file")
map("n", "<leader>f", ":Ex<CR>", "Open netrw")
map("n", "<Esc>", ":nohl<CR>", "Clear search highlight")
map("v", "<", "<gv", "Preserve highlight after indent")
map("v", ">", ">gv", "Preserve highlight after indent")

-- Clipboard
map("n", "<leader>cf", "mmggVG\"+yg'm", "Copy entire file")
map("v", "<leader>y", '"+y', "[Y]ank selection to clipboard")
map("n", "<leader>y", '"+y', "[Y]ank to clipboard")
map("n", "<leader>p", '"+p', "[P]aste from clipboard")

-- Move lines
map("n", "<A-j>", ":m .+1<CR>==", "Move line down")
map("n", "<A-k>", ":m .-2<CR>==", "Move line up")
map("i", "<A-j>", "<ESC>:m .+1<CR>==gi", "Move line down")
map("i", "<A-k>", "<ESC>:m .-2<CR>==gi", "Move line up")
map("v", "<A-j>", ":m '>+1<CR>gv=gv", "Move selection down")
map("v", "<A-k>", ":m '<-2<CR>gv=gv", "Move selection up")

-- Undotree (Builtin)
map("n", "<leader>u", function()
	vim.cmd.packadd("nvim.undotree")
	require("undotree").open()
end, "Open Builtin Undotree")

