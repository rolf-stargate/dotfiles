local configs = require("nvim-treesitter.configs")

vim.treesitter.language.register("markdown", { "vimwiki" })

configs.setup({
	ensure_installed = "all",
	sync_install = true,
	ignore_install = { "" }, -- List of parsers to ignore installing
	query_linter = {
		enable = true,
		use_virtual_text = false,
		lint_events = { "BufWrite", "CursorHold" },
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		additional_vim_regex_highlighting = { "ruby", "markdown" },
	},
	autotag = {
		enable = true,
	},
	-- indent = { enable = true, disable = { "yaml" } },
})

require("treesitter-context").setup({
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	max_lines = 2, -- How many lines the window should span. Values <= 0 mean no limit.
	min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
	line_numbers = true,
	multiline_threshold = 20, -- Maximum number of lines to show for a single context
	trim_scope = "inner", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
	mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
	-- Separator between context and content. Should be a single character string, like '-'.
	-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
	separator = "-",
	zindex = 20, -- The Z-index of the context window
	on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
})

vim.keymap.set("n", "<leader>ck", function()
	require("treesitter-context").go_to_context(vim.v.count1)
end, { noremap = true, desc = "Jump to top context" })
