vim.api.nvim_create_autocmd("FileType", {
	pattern = "c",
	callback = function()
		vim.cmd("set iskeyword-=-") -- handle foo-bar as three words

		vim.keymap.set(
			"n",
			"<leader>DD",
			":silent!./build.sh<CR>:GdbStart gdb -q -x gdb.cmd --args ./build/main",
			{ buffer = true, noremap = true, desc = "GdbStart" }
		)

		vim.keymap.set("n", "<leader>Dd", function()
			vim.cmd("!./build.sh")
			local line_number = vim.api.nvim_win_get_cursor(0)[1]
			local command = "GdbStart gdb -q -ex b\\ " .. line_number .. " -ex run -x gdb.cmd --args ./build/main"
			vim.cmd(command)
		end, { buffer = true, noremap = true, desc = "GdbStart break on current line and run" })

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
		-- vim.keymap.set("n", "<leader>DI", ":GdbUntil<CR>", { buffer = true, noremap = true, desc = "Interrupt" })

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

-- vim.api.nvim_create_autocmd({ "User" }, {
-- 	pattern = { "NvimGdbQuery" },
-- 	callback = function()
--
-- 		-- coroutine.resume(coroutine.create(function()
-- 		-- 	local app = require("nvimgdb").here
-- 		-- 	local output = app:custom_command_async("")
-- 		-- 	print(output)
-- 		-- 	-- Do whatever is required to process the output
-- 		-- end))
