vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.md",
  callback = function()
    local cmd = "task sync > /dev/null 2>&1 &"
    vim.fn.system(cmd)
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.md",
  callback = function()
    vim.cmd("setlocal updatetime=100")
		vim.keymap.set(
			"n",
			"<leader>dd",
			":EasyTablesCreateNew 3x3<cr>",
			{ buffer = true, noremap = true, desc = "Create 3x3 table" }
		)
		vim.keymap.set(
			"n",
			"<leader>DD",
			":EasyTablesCreateNew ",
			{ buffer = true, noremap = true, desc = "Create table" }
		)
		vim.keymap.set(
			"n",
			"<leader>dE",
			":EasyTablesImportThisTable<cr>",
			{ buffer = true, noremap = true, desc = "Edit table" }
		)
		vim.keymap.set(
			"n",
			"<leader>de",
			":ExportTable<cr>",
			{ buffer = true, noremap = true, desc = "Export table" }
		)
  end,
})

vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*.md",
  callback = function()
    print("test")
    vim.cmd("lua require('hover').hover()")
  end
})
