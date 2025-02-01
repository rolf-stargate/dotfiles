require("parrot").setup({
	providers = {
		deepseek = {
			style = "openai",
			api_key = os.getenv("DEEPSEEK_API_KEY"),
			endpoint = "https://api.deepseek.com/v1/chat/completions",
			models = {
				"deepseek-chat",
			},
			-- parameters to summarize chat
			topic = {
				model = "DeepSeekV1",
				params = { max_completion_tokens = 64 },
			},
			params = {
				chat = { temperature = 1.1, top_p = 1 },
				command = { temperature = 1.1, top_p = 1 },
			},
		},
	}, -- Providers must be explicitly added to make them available.
})
