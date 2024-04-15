vim.cmd("autocmd BufEnter * ColorizerToggle")

vim.api.nvim_set_keymap("n", "<leader>tc", "<cmd>ColorizerToggle<Cr>", {
	noremap = true,
	silent = true,
	desc = "Toggle Color",
})
