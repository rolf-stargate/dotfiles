local keymap = vim.keymap.set

vim.keymap.set("n", "<leader>cc", "<cmd>ColorPicker<cr>", {
	noremap = true,
	silent = true,
	desc = "ColorPicker",
})
