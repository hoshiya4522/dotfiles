
vim.g.autoread = true
vim.g.ignorecase = true
vim.g.cmdheight = 2
vim.wo.cursorline = true
vim.wo.cursorcolumn = true
vim.wo.linebreak = true
vim.wo.wrap = true
vim.wo.scrolloff = 4
vim.g.nobackup = true
vim.g.undofile = true
vim.g.undodir = "~/.config/nvim/undodir"
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.g.termguicolors = true
vim.wo.rnu = true
vim.wo.nu = true
vim.g.mapleader = ' '
vim.g.maplocalleader = "<BS>"



require"nvim-tree".update_focused_file = {enable = true }
