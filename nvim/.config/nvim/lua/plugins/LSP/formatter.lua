-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			-- "formatter.filetypes.lua" defines default configurations for the
			-- "lua" filetype
			require("formatter.filetypes.lua").stylua,

			-- You can also define your own configuration
			function()
				-- Supports conditional formatting
				if util.get_current_buffer_file_name() == "special.lua" then
					return nil
				end

				-- Full specification of configurations is down below and in Vim help
				-- files
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},

		vue = {
			require("formatter.filetypes.vue").prettier,
			function()
				return {
					exe = "prettier",
					args = {
						util.escape_path(util.get_current_buffer_file_path()),
					},
					stdin = true,
				}
			end,
		},

		ts = {
			function()
				return {
					exe = "prettier",
					args = {
						util.escape_path(util.get_current_buffer_file_path()),
					},
					stdin = true,
				}
			end,
		},

		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

-- Create a new augroup named 'FormatAutogroup'
vim.api.nvim_create_augroup("FormatAutogroup", { clear = true })

-- Add an autocmd to 'FormatAutogroup' for Lua files
vim.api.nvim_create_autocmd("BufWritePost", {
	group = "FormatAutogroup",
	pattern = "*.lua",
	command = "FormatWrite",
})

vim.api.nvim_create_autocmd("BufWritePost", {
	group = "FormatAutogroup",
	pattern = "*.vue",
	command = "FormatWrite",
})

vim.api.nvim_create_autocmd("BufWritePost", {
	group = "FormatAutogroup",
	pattern = "*.ts",
	command = "FormatWrite",
})
