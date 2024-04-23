vim.api.nvim_create_autocmd("FileType", {
	pattern = "c",
	callback = function()
		-- Use vim.keymap.set for Neovim 0.7 and above
		vim.keymap.set(
			"n",
			"<leader>RR",
			":FloatermNew --autoclose=0 --wintype=split ./run.sh<CR>",
			{ buffer = true, noremap = true, desc = "Execute run.sh" }
		)
		vim.keymap.set(
			"n",
			"<leader>RD",
			":FloatermNew --autoclose=0 --height=1.0 --wintype=split ./debug.sh<CR>",
			{ buffer = true, noremap = true, desc = "Execute debug.sh" }
		)
		vim.keymap.set(
			"n",
			"<leader>RB",
			":FloatermNew --autoclose=0 --wintype=split ./build.sh<CR>",
			{ buffer = true, noremap = true, desc = "Execute build.sh" }
		)
	end,
})
