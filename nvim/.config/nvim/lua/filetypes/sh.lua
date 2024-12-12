vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*",
	callback = function()
		local filename = vim.fn.expand("%:t")
		if filename:match("^.*(sh|bash)$") or not filename:match("%.") then
			vim.bo.expandtab = false
		end
	end,
})
