require("avante").setup({
	provider = "openai",
	auto_suggestions_provider = "copilot",

	claude = {
		endpoint = "https://api.anthropic.com",
		model = "claude-3-5-sonnet-20241022",
		temperature = 0,
		max_tokens = 4096,
		api_key_name = "CLAUDE_API_KEY",
	},
	-- openai = {
	-- 	endpoint = "https://api.openai.com/v1",
	-- 	model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
	-- 	timeout = 30000, -- timeout in milliseconds
	-- 	temperature = 0, -- adjust if needed
	-- 	max_tokens = 4096,
	-- 	api_key_name = "OPENAI_API_KEY",
	-- },
	openai = {
		endpoint = "https://api.deepseek.com/v1",
		model = "deepseek-chat",
		timeout = 30000, -- Timeout in milliseconds
		temperature = 0,
		max_tokens = 4096,
		-- optional
		api_key_name = "DEEPSEEK_API_KEY",
	},
	mappings = {
		submit = {
			normal = "<Leader>gg",
			insert = "<leader>gg",
		},
	},
	windows = {
		position = "bottom",
		sidebar_header = {
			enabled = true,
		},
		edit = {
			border = "rounded",
			start_insert = false, -- Start insert mode when opening the edit window
		},
		ask = {
			floating = true, -- Open the 'AvanteAsk' prompt in a floating window
			start_insert = true, -- Start insert mode when opening the ask window
			border = "rounded",
			---@type "ours" | "theirs"
			focus_on_apply = "ours", -- which diff to focus after applying
		},
	},
})
