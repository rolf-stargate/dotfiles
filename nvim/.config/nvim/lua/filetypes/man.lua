vim.api.nvim_create_autocmd("FileType", {
	pattern = "man",
	callback = function()
		vim.keymap.set("n", "<CR>", "<S-]>", { buffer = true, noremap = true, desc = "Execute run.sh" })
	end,
})
