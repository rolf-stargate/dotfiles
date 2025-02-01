require("gp").setup({
	openai_api_key = { "gpg", "--decrypt", "/home/rolf/openai_key.gpg" },
	toggle_target = "split",
	chat_user_prefix = "*Rolf*:",
	chat_assistant_prefix = { "KI:", "[{{agent}}]" },
	command_prompt_prefix_template = "KI {{agent}} ~ ",
	providers = {
		deepseek = {
			endpoint = "https://api.deepseek.com/v1/chat/completions",
			secret = os.getenv("DEEPSEEK_API_KEY"),
		},
	},
	agents = {
		{
			name = "DeepSeek",
			provider = "deepseek",
			chat = true,
			command = false,
			-- string with model name or table with model name and parameters
			model = { model = "deepseek-chat" },
			-- system prompt (use this to specify the persona/role of the AI)
			system_prompt = "You are a general AI assistant.\n\n"
				.. "The user provided the additional info about how they would like you to respond:\n\n"
				.. "- If you're unsure don't guess and say you don't know instead.\n"
				.. "- Ask question if you need clarification to provide better answer.\n"
				.. "- Think deeply and carefully from first principles step by step.\n"
				.. "- Zoom out first to see the big picture and then zoom in to details.\n"
				.. "- Use Socratic method to improve your thinking and coding skills.\n"
				.. "- Don't elide any code from your output if the answer requires coding.\n"
				.. "- Take a deep breath; You've got this!\n",
		},
	},
	hooks = {
		CodeReview = function(gp, params)
			local template = "I have the following code from {{filename}}:\n\n"
				.. "```{{filetype}}\n{{selection}}\n```\n\n"
				.. "Please analyze for code smells and suggest improvements."
			local agent = gp.get_chat_agent()
			gp.Prompt(params, gp.Target.new("markdown"), agent, template)
		end,
		AddComments = function(gp, params)
			local template = "I have the following code from {{filename}}:\n\n"
				.. "```{{filetype}}\n{{selection}}\n```\n\n"
				.. "Please add comments to the code but do not change it."
			local agent = gp.get_command_agent()
			gp.Prompt(params, gp.Target.rewrite, agent, template)
		end,
		Summarize = function(gp, params)
			local template = "I have the following text from {{filename}}:\n\n"
				.. "```{{filetype}}\n{{selection}}\n```\n\n"
				.. "Please summarize the text in very short, concise bullet points. No hole sentences."
			local agent = gp.get_command_agent()
			gp.Prompt(params, gp.Target.rewrite, agent, template)
		end,
		Shorten = function(gp, params)
			local template = "I have the following text from {{filename}}:\n\n"
				.. "```{{filetype}}\n{{selection}}\n```\n\n"
				.. "Please shorten the text making it very concise."
			local agent = gp.get_command_agent()
			gp.Prompt(params, gp.Target.rewrite, agent, template)
		end,
		InfoToText = function(gp, params)
			local template = "I have the following text from {{filename}}:\n\n"
				.. "```{{filetype}}\n{{selection}}\n```\n\n"
				.. "Please create a concise and unemotional text, including all the information from the text snipped."
			local agent = gp.get_command_agent()
			gp.Prompt(params, gp.Target.rewrite, agent, template)
		end,
		Description = function(gp, params)
			local template = "I have the following text from {{filename}}:\n\n"
				.. "```{{filetype}}\n{{selection}}\n```\n\n"
				.. "Please create a short and concise description of the selected."
			local agent = gp.get_command_agent()
			gp.Prompt(params, gp.Target.rewrite, agent, template)
		end,
		Name = function(gp, params)
			local template = "I have the following function, varibale, context or paragrap {{filename}}:\n\n"
				.. "```{{filetype}}\n{{selection}}\n```\n\n"
				.. "Please create a descriptiv name for the selected function, variable, context or paragraph."
			local agent = gp.get_command_agent()
			gp.Prompt(params, gp.Target.rewrite, agent, template)
		end,
		Spelling = function(gp, params)
			local template = "I have the following text from {{filename}}:\n\n"
				.. "```{{filetype}}\n{{selection}}\n```\n\n"
				.. "Please correct the spelling and punctuation."
			local agent = gp.get_command_agent()
			gp.Prompt(params, gp.Target.rewrite, agent, template)
		end,
		Explain = function(gp, params)
			local template = "I have the following code from {{filename}}:\n\n"
				.. "```{{filetype}}\n{{selection}}\n```\n\n"
				.. "Please respond by explaining the code above."
			local agent = gp.get_chat_agent()
			gp.Prompt(params, gp.Target.new("markdown"), agent, template)
		end,
		VimwikiTags = function(gp, params)
			local pwd = vim.fn.getcwd()
			local cmd = "find "
				.. pwd
				.. " -maxdepth 1 -type f | xargs -n 1 grep -oE ':[a-z0-9]+:' | tr -d ':' | sort | uniq | paste -d: -s"

			local handle = io.popen(cmd)
			local tags = handle:read("*a")
			handle:close()
			local template = "I have the following text from {{filename}}:\n\n"
				.. "```{{filetype}}\n{{selection}}\n```\n\n"
				.. "and the following colon-separated list of used tags in the current wiki:\n\n"
				.. ":"
				.. tags
				.. ":"
				.. "\n\n"
				.. "Please give me an appropriate, colon-separated list of tags for the given context. You can add new ones if necessary but should strongly prefer to pick fitting ones from the given list. Give me the list in the following format :tag1:tag2:tag3: Give me only the list!"
			local agent = gp.get_chat_agent()
			gp.Prompt(params, gp.Target.prepend, agent, template)
		end,
	},
})

-- VISUAL mode mappings
-- s, x, v modes are handled the same way by which_key
require("which-key").add({

	{
		mode = { "v" },
		{ "<leader>gR", ":<C-u>'<,'>GpCodeReview<cr>", desc = "Review selection", nowait = true, remap = false },
		{ "<leader>ga", ":<C-u>'<,'>GpAppend<cr>", desc = "Visual Append (after)", nowait = true, remap = false },
		{ "<leader>gb", ":<C-u>'<,'>GpPrepend<cr>", desc = "Visual Prepend (before)", nowait = true, remap = false },
		{
			"<leader>gc",
			":<C-u>'<,'>GpAddComments<cr>",
			desc = "Add comments to selection",
			nowait = true,
			remap = false,
		},
		{ "<leader>gs", ":<C-u>'<,'>GpSummarize<cr>", desc = "Summarize selection", nowait = true, remap = false },
		{ "<leader>gS", ":<C-u>'<,'>GpShorten<cr>", desc = "Shorten selection", nowait = true, remap = false },
		{ "<leader>gt", ":<C-u>'<,'>GpVimwikiTags<cr>", desc = "Add Tags", nowait = true, remap = false },
		{ "<leader>gT", ":<C-u>'<,'>GpInfoToText<cr>", desc = "Information to text", nowait = true, remap = false },
		{ "<leader>gC", ":<C-u>'<,'>GpSpelling<cr>", desc = "Correct spelling", nowait = true, remap = false },
		{ "<leader>ge", ":<C-u>'<,'>GpExplain<cr>", desc = "Explain selection", nowait = true, remap = false },
		{ "<leader>gd", ":<C-u>'<,'>GpDescription<cr>", desc = "Short Description", nowait = true, remap = false },
		{ "<leader>gn", ":<C-u>'<,'>GpName<cr>", desc = "Name selection ", nowait = true, remap = false },
		{ "<leader>gg", group = "generate into new ..", nowait = true, remap = false },
		{ "<leader>gge", ":<C-u>'<,'>GpEnew<cr>", desc = "Visual GpEnew", nowait = true, remap = false },
		{ "<leader>ggn", ":<C-u>'<,'>GpNew<cr>", desc = "Visual GpNew", nowait = true, remap = false },
		{ "<leader>ggp", ":<C-u>'<,'>GpPopup<cr>", desc = "Visual Popup", nowait = true, remap = false },
		{ "<leader>ggt", ":<C-u>'<,'>GpTabnew<cr>", desc = "Visual GpTabnew", nowait = true, remap = false },
		{ "<leader>ggv", ":<C-u>'<,'>GpVnew<cr>", desc = "Visual GpVnew", nowait = true, remap = false },
		{ "<leader>gi", ":<C-u>'<,'>GpImplement<cr>", desc = "Implement selection", nowait = true, remap = false },
		{ "<leader>gr", ":<C-u>'<,'>GpRewrite<cr>", desc = "Visual Rewrite", nowait = true, remap = false },
	},
})

-- NORMAL mode mappings
require("which-key").add({
	{
		{ "<leader>gN", "<cmd>GpNextAgent<cr>", desc = "Next Agent", nowait = true, remap = false },
		{ "<leader>gS", "<cmd>GpStop<cr>", desc = "GpStop", nowait = true, remap = false },
		{ "<leader>gt", "<cmd>GpChatToggle split<cr>", desc = "Toggle Chat", nowait = true, remap = false },
		{ "<leader>gw", group = "Whisper", nowait = true, remap = false },
		{ "<leader>gwa", "<cmd>GpWhisperAppend<cr>", desc = "Whisper Append (after)", nowait = true, remap = false },
		{ "<leader>gwb", "<cmd>GpWhisperPrepend<cr>", desc = "Whisper Prepend (before)", nowait = true, remap = false },
		{ "<leader>gwe", "<cmd>GpWhisperEnew<cr>", desc = "Whisper Enew", nowait = true, remap = false },
		{ "<leader>gwn", "<cmd>GpWhisperNew<cr>", desc = "Whisper New", nowait = true, remap = false },
		{ "<leader>gwp", "<cmd>GpWhisperPopup<cr>", desc = "Whisper Popup", nowait = true, remap = false },
		{ "<leader>gwr", "<cmd>GpWhisperRewrite<cr>", desc = "Whisper Inline Rewrite", nowait = true, remap = false },
		{ "<leader>gwt", "<cmd>GpWhisperTabnew<cr>", desc = "Whisper Tabnew", nowait = true, remap = false },
		{ "<leader>gwv", "<cmd>GpWhisperVnew<cr>", desc = "Whisper Vnew", nowait = true, remap = false },
		{ "<leader>gww", "<cmd>GpWhisper<cr>", desc = "Whisper", nowait = true, remap = false },
		{ "<leader>gx", "<cmd>GpContext<cr>", desc = "Toggle GpContext", nowait = true, remap = false },
	},
})
