local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>cc", "<cmd>ColorPicker<cr>", opts)
