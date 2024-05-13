vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = filetypes,
	callback = function()
    os.execute("sleep 5 && task sync")
	end,
})
