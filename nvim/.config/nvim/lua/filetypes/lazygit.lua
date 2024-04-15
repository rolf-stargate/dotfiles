-- Git commit messages(lazygit)
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "COMMIT_EDITMSG" },
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.textwidth = 80
	end,
})
