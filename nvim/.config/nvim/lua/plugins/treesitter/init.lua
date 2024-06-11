local configs = require("nvim-treesitter.configs")
configs.setup({
	ensure_installed = "all",
	sync_install = false,
	ignore_install = { "" }, -- List of parsers to ignore installing
	query_linter = {
		enable = true,
		use_virtual_text = true,
		lint_events = { "BufWrite", "CursorHold" },
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "markdown" }, -- list of language that will be disabled
	},
	-- indent = { enable = true, disable = { "yaml" } },
})

vim.api.nvim_set_hl(0, "@function.debug.javascript", { link = "MyDebug" })
vim.api.nvim_set_hl(0, "@parameter.debug.javascript", { link = "MyDebug" })
vim.api.nvim_set_hl(0, "@text.strong", { link = "markdownBold" })
vim.api.nvim_set_hl(0, "@text.emphasis", { link = "markdownBold" })
