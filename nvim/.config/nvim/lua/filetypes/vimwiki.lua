vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.md",
	callback = function()
		local cmd = "task sync > /dev/null"
		local output = vim.fn.system(cmd)

		local exit_code = vim.v.shell_error

		if exit_code ~= 0 then
			print(output)
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "vimwiki",
	callback = function()
		vim.cmd("setlocal softtabstop=3")
		vim.cmd("setlocal shiftwidth=3")
		vim.cmd("setlocal updatetime=100")

		vim.keymap.set(
			"n",
			"<leader>dd",
			":VimwikiTable ",
			{ buffer = true, noremap = true, desc = "Create 3x3 table" }
		)
		vim.keymap.set(
			"n",
			"<leader>lp",
			":pandoc % -o %.pdf --template=/home/rolf/.config/nvim/templates/letter.latex && brave %.pdf<cr>",
			{ buffer = true, noremap = true, desc = "Create 3x3 table" }
		)
		vim.keymap.set(
			"n",
			"<C-g>g",
			"G?rolf:<cr>:nohlsearch<cr>A ",
			{ buffer = true, noremap = true, desc = "ChatGpt Jump to Input" }
		)
		vim.keymap.set(
			"i",
			"<C-g>g",
			"<esc>G?rolf:<cr>:nohlsearch<cr>A ",
			{ buffer = true, noremap = true, desc = "ChatGpt Jump to Input" }
		)
	end,
})

vim.api.nvim_create_autocmd("CursorHold", {
	pattern = "*.md",
	callback = function()
		vim.cmd("lua require('hover').hover()")
	end,
})
