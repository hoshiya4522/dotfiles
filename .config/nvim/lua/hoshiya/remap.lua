vim.g.mapleader = " "

-- netrw shortcut
vim.keymap.set("n", "<leader>jk", vim.cmd.Ex)

-- copy and paste from system clipboard
vim.keymap.set("n", "<A-c>", '"+y')
vim.keymap.set("v", "<A-c>", '"+y')
vim.keymap.set("n", "<A-v>", '"+p')

-- Escape key is too far
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("v", "jk", "<ESC>")

-- s is quite useless for me so save key it is!
vim.keymap.set("n", "s", ":w<CR>")

-- -- Surrounds. might replace with a plugin later
-- vim.keymap.set("i", "\"", "\"\"<esc>i")
-- vim.keymap.set("i", "'", "''<ESC>i")
-- vim.keymap.set("i", "(", "()<ESC>i")
-- vim.keymap.set("i", "{", "{}<ESC>i")
-- vim.keymap.set("i", "[", "[]<ESC>i")

-- workaround for the windeeznuts terminal
vim.keymap.set("n", "<M-v>", "<C-v>", {}) --cuz windows terminal won't let me

-- resize splits
vim.keymap.set("n", "<C-A-h>", "<C-w><", {})
vim.keymap.set("n", "<C-A-j>", "<C-w>-", {})
vim.keymap.set("n", "<C-A-k>", "<C-w>+", {})
vim.keymap.set("n", "<C-A-l>", "<C-w>>", {})

-- move between splits
vim.keymap.set("n", "<C-h>", "<C-w>h", {})
vim.keymap.set("n", "<C-j>", "<C-w>j", {})
vim.keymap.set("n", "<C-k>", "<C-w>k", {})
vim.keymap.set("n", "<C-l>", "<C-w>l", {})

-- move line or block of code
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", {})
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", {})
vim.keymap.set("i", "<A-j>", "<ESC>:m .+1<CR>==gi", {})
vim.keymap.set("i", "<A-k>", "<ESC>:m .-2<CR>==gi", {})
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", {}) -- this helps moving blocks of code
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", {})

-- Compiles and runs the current file. <F5> for without input running and <F6> for with input running. Input(s) must be written in a file named "input"
-- for C
vim.api.nvim_create_autocmd("FileType", { pattern = "c", command = [[nnoremap <F5> :wa <CR> :![ -e a.out ] && rm a.out; echo "\nCompiling..."; clang % && echo "Compiled ✓\n" && time ( timeout 8 ./a.out ) <CR>]] })
vim.api.nvim_create_autocmd("FileType", { pattern = "c", command = [[nnoremap <F6> :wa <CR> :![ -e a.out ] && rm a.out; echo "\nCompiling..."; clang % && echo "Compiled ✓\n" && time ( timeout 8 ./a.out<input ) <CR>]] })
-- for C++
vim.api.nvim_create_autocmd("FileType", { pattern = "cpp", command = [[nnoremap <F5> :wa <CR> :![ -e a.out ] && rm a.out; echo "\nCompiling..."; g++ --std=c++11 -Wall % && echo "Compiled ✓\n" && time ( timeout 8 ./a.out ) <CR>]] })
vim.api.nvim_create_autocmd("FileType", { pattern = "cpp", command = [[nnoremap <F6> :wa <CR> :![ -e a.out ] && rm a.out; echo "\nCompiling..."; g++ --std=c++11 -Wall % && echo "Compiled ✓\n" && time ( timeout 8 ./a.out<input ) <CR>]] })
