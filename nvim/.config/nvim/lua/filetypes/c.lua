vim.api.nvim_create_autocmd("FileType", {
	pattern = "c",
	callback = function()
		-- Use vim.keymap.set for Neovim 0.7 and above
		vim.keymap.set(
			"n",
			"<leader>DD",
			":silent!./build.sh<CR>:GdbStart gdb -q -x gdb.cmd --args ./build/main",
			{ buffer = true, noremap = true, desc = "GdbStart" }
		)
		vim.keymap.set(
			"n",
			"<leader>DG",
			":silent!./build.sh<CR>:silent!gdbgui --args ./build/main",
			{ buffer = true, noremap = true, desc = "Interrupt" }
		)
		vim.keymap.set(
			"n",
			"<leader>DB",
			":FloatermNew --autoclose=0 --wintype=split ./build.sh<CR>",
			{ buffer = true, noremap = true, desc = "Build" }
		)
		vim.keymap.set(
			"n",
			"<leader>DR",
			":FloatermNew --autoclose=0 --wintype=split ./build.sh && ./run.sh<CR>",
			{ buffer = true, noremap = true, desc = "Run" }
		)
		vim.keymap.set(
			"n",
			"<leader>Dr",
			":FloatermNew --autoclose=0 --wintype=split ./build.sh && ./run.sh",
			{ buffer = true, noremap = true, desc = "Run" }
		)
		vim.keymap.set("n", "<leader>DQ", ":GdbDebugStop<CR>", { buffer = true, noremap = true, desc = "Quit" })
		vim.keymap.set("n", "<leader>DW", ":GdbCreateWatch", { buffer = true, noremap = true, desc = "Open Watch" })
		vim.keymap.set(
			"n",
			"<leader>Db",
			":GdbLopenBacktrace<CR>",
			{ buffer = true, noremap = true, desc = "Open Backtrace" }
		)
		vim.keymap.set("n", "<leader>DU", ":GdbUntil<CR>", { buffer = true, noremap = true, desc = "Until" })
		vim.keymap.set("n", "<leader>DI", ":GdbUntil<CR>", { buffer = true, noremap = true, desc = "Interrupt" })

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
	end,
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
