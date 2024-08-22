require("hover").setup({
	init = function()
		-- Require providers
		require("hover.providers.lsp")
		-- require('hover.providers.gh')
		-- require('hover.providers.gh_user')
		-- require('hover.providers.jira')
		require("hover.providers.man")
		-- require('hover.providers.dictionary')
	end,
	preview_opts = {
		border = "single",
	},
	-- Whether the contents of a currently open hover window should be moved
	-- to a :h preview-window when pressing the hover keymap.
	preview_window = false,
	title = true,
	mouse_providers = {
		"LSP",
	},
	mouse_delay = 1000,
})

-- Setup keymaps
vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })

-- Mouse support
vim.keymap.set("n", "<MouseMove>", require("hover").hover_mouse, { desc = "hover.nvim (mouse)" })
vim.o.mousemoveevent = true

require("hover").register({
	name = "Task Annotations",
	enabled = function(bufnr)
		local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")

		if filetype == "vimwiki" then
			return true
		end

		return false
	end,
	execute = function(opts, done)
		local line_content = vim.api.nvim_buf_get_lines(opts.bufnr, opts.pos[1] - 1, opts.pos[1], false)
		local part_uuid = string.match(line_content[1], "#([a-z0-9]+)$")

		local annotations = {}
		if part_uuid ~= nil then
			local cmd = "task_per_uuid_get_annotations " .. part_uuid
			local output = vim.fn.system(cmd)
			for line in output:gmatch("[^\r\n]+") do
				table.insert(annotations, line)
			end
		end
		if #annotations > 0 then
			done({ lines = annotations, filetype = "vimwiki" })
		end
	end,
})
