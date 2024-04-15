vim.cmd("let g:mundo_preview_bottom = 1")
vim.cmd("let g:mundo_preview_height = 35")
vim.cmd("let g:mundo_width = 25")

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "U", "<cmd>MundoToggle<cr>", opts)
