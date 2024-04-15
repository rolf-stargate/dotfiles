vim.cmd("let g:mundo_preview_bottom = 1")
vim.cmd("let g:mundo_preview_height = 35")
vim.cmd("let g:mundo_width = 25")

vim.api.nvim_set_keymap("n", "U", "<cmd>MundoToggle<cr>", {
	noremap = true,
	silent = true,
	desc = "Mundo Toggle",
})
