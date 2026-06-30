require("telescope").setup()

local tsc = require("telescope.builtin")

vim.keymap.set('n', '<leader>ff', tsc.find_files, {desc="[f]ind [f]iles"})
vim.keymap.set('n', '<leader>fb', tsc.buffers, {desc="[f]ind [b]uffers"})
