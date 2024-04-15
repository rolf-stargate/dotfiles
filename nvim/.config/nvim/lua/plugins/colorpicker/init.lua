local keymap = vim.api.nvim_set_keymap

vim.api.nvim_set_keymap("n", "<leader>cc", "<cmd>ColorPicker<cr>", {
	noremap = true,
	silent = true,
	desc = "ColorPicker",
})
