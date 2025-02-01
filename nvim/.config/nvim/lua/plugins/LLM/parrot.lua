require("parrot").setup({
	providers = {
		openai = {
			api_key = os.getenv("OPENAI_API_KEY"),
		},
		deepseek = {
			style = "openai",
			api_key = os.getenv("DEEPSEEK_API_KEY"),
			endpoint = "https://api.deepseek.com",
			models = {
				"deepseek-chat",
				"deepseek-reasoner",
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
	},
	chat_user_prefix = "**Rolf**:",
	llm_prefix = "*Computer*:",
	toggle_target = "split",
	command_prompt_prefix_template = "{{llm}} ~ ",
	hooks = {
		SpellCheck = function(prt, params)
			local chat_prompt = [[
        Your task is to take the text provided and rewrite it into a clear,
        grammatically correct version while preserving the original meaning
        as closely as possible. Correct any spelling mistakes, punctuation
        errors, verb tense issues, word choice problems, and other
        grammatical mistakes.

        Provided text:
        ```{{selection}}`
      ]]
			local model_obj = prt.get_model("command")
			prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
		end,
	},
})
