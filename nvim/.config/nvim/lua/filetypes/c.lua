vim.api.nvim_create_autocmd("FileType", {
	pattern = "c",
	callback = function()
		-- Use vim.keymap.set for Neovim 0.7 and above
		vim.keymap.set(
			"n",
			"<leader>dd",
			":silent!./build.sh<CR>:GdbStart gdb -q ./build/main",
			{ buffer = true, noremap = true, desc = "GdbStart" }
		)
		vim.keymap.set(
			"n",
			"<leader>dg",
			":silent!./build.sh<CR>:silent!gdbgui ./build/main", { buffer = true, noremap = true, desc = "Interrupt" }
		)
		vim.keymap.set(
			"n",
			"<leader>db",
			":FloatermNew --autoclose=0 --wintype=split ./build.sh<CR>",
			{ buffer = true, noremap = true, desc = "Build" }
		)
		vim.keymap.set(
			"n",
			"<leader>dr",
			":GdbRun<CR>",
			{ buffer = true, noremap = true, desc = "Run" }
		)
		vim.keymap.set(
			"n",
			"<leader>dq",
			":GdbDebugStop<CR>",
			{ buffer = true, noremap = true, desc = "Quit" }
		)
		vim.keymap.set(
			"n",
			"<leader>dw",
			":GdbCreateWatch",
			{ buffer = true, noremap = true, desc = "Open Watch" }
		)
		vim.keymap.set(
			"n",
			"<leader>dB",
			":GdbLopenBacktrace<CR>",
			{ buffer = true, noremap = true, desc = "Open Backtrace" }
		)
		vim.keymap.set(
			"n",
			"<leader>du",
			":GdbUntil<CR>",
			{ buffer = true, noremap = true, desc = "Until" }
		)
		vim.keymap.set(
			"n",
			"<leader>di",
			":GdbUntil<CR>",
			{ buffer = true, noremap = true, desc = "Interrupt" }
		)

    vim.keymap.set("n", "<Leader>{", "<Esc>o{<CR>}<Esc>ko", {
      noremap = true,
      silent = true,
      desc = "Create Code Block {}",
    })
    vim.keymap.set("i", "<Leader>{", "<Esc>o{<CR>}<Esc>ko", {
      noremap = true,
      silent = true,
      desc = "Create Code Block {}",
    })
    vim.keymap.set("n", "<Leader>}", "<Esc>o{<CR>}<Esc>ko", {
      noremap = true,
      silent = true,
      desc = "Create Code Block {}",
    })
    vim.keymap.set("i", "<Leader>}", "<Esc>o{<CR>}<Esc>ko", {
      noremap = true,
      silent = true,
      desc = "Create Code Block {}",
    })
  end
})

-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = "*.c",
--   callback = function()
--     local file_path = vim.fn.expand("%:p")
--     local result = vim.fn.system("clang-format -i -style='GNU' " .. file_path)
--     if vim.v.shell_error ~= 0 then
--       vim.notify("clang-format failed!", vim.log.levels.ERROR)
--     end
--     vim.cmd("edit!")
--   end,
-- })
