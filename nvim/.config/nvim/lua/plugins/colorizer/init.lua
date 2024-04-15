vim.cmd("autocmd BufEnter * ColorizerToggle")

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>tc", "<cmd>ColorizerToggle<Cr>", opts)
