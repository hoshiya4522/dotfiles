vim.o.nu = true
vim.o.rnu = true

vim.o.termguicolors = true

-- yes im insane
vim.o.tabstop = 8  -- \t width
vim.o.softtabstop = 8  -- how many spaces does tab insert
vim.o.shiftwidth = 8  -- >> or << width
vim.o.expandtab = false -- no not that insane.

vim.o.wrap = true
vim.o.smartindent = true
vim.o.inccommand = 'split'  -- preview of search and replace commands in a split window.

vim.o.splitbelow = true  -- for the help to split from below

vim.o.ignorecase = true
vim.o.smartcase = true  -- Override the 'ignorecase' option if the search pattern contains upper

-- vim.o.swapfile = false  -- disable swap file
vim.o.backup = false  -- disable backup file

-- mkdir -p $HOME/.local/share/nvim/undodir
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.o.undofile = true

vim.opt.isfname:append("@-@")  -- appearntly this is important for typescript

vim.o.scrolloff = 4

vim.opt.cursorline = true
-- vim.opt.colorcolumn = "80";

vim.o.winborder = 'rounded'
