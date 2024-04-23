vim.cmd("autocmd BufEnter * ColorizerToggle")

vim.keymap.set("n", "<leader>tc", "<cmd>ColorizerToggle<Cr>", {
	noremap = true,
	silent = true,
	desc = "Toggle Color",
})
