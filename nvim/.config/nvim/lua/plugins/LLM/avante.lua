require("avante").setup({
	-- provider = "openai",
	auto_suggestions_provider = "copilot",

	provider = "deepseek",
	vendors = {
		deepseek = {
			__inherited_from = "openai",
			api_key_name = "DEEPSEEK_API_KEY",
			endpoint = "https://api.deepseek.com",
			model = "deepseek-coder",
		},
	},

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

-- Tidy up prompt
vim.api.nvim_create_autocmd("User", {
	pattern = "Tidy_UP!",
	callback = function()
		require("avante.config").override({
			system_prompt = [[
      {% extends "planning.avanterules" %}
      {% block user_prompt %}
      Tidy up the code make it nice and readable but do not change the functionality!
      Order it by fitting categories and use the comment template below to separate
      the sections and also follow the Comment Template Instructions from below it.

      Comment Template:
      <!-- |////|__ SECTION_TITEL_A __|////////////////////////////////////////|») -->
      <!-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: -->
          Codeblock...

      <!-- ::::::.. SECTION_TITEL_B ..:::::::::::::::::::::::::::::::::::::::::::: -->
          Codeblock...


      <!-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: -->
      <!-- («|////////////////////////////////////////|__ SECTION_TITEL_A __|////| -->

      Comment Template Instructions:
      Change the comment template from HTML to the apropriate comment syntx of the current
      file type. The comment line as a hole should always be be 80 chars long.
      {% endblock %}
      ]],
		})
	end,
})

-- Key mappings for visual mode
vim.keymap.set("v", "<leader>at", function()
	vim.api.nvim_exec_autocmds("User", { pattern = "Tidy_UP!" })
	require("avante")
end, { desc = "avante: Tidy_UP!" })
