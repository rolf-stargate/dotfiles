require("gp").setup({
	openai_api_key = { "gpg", "--decrypt", "/home/rolf/openai_key.gpg" },
	toggle_target = "split",
	chat_user_prefix = "*Rolf*:",
	chat_assistant_prefix = { "KI:", "[{{agent}}]" },
	command_prompt_prefix_template = "KI {{agent}} ~ ",
	agents = {
		{
			name = "ChatGPT-4o",
			chat = true,
			command = false,
			-- string with model name or table with model name and parameters
			model = { model = "gpt-4o", temperature = 1.1, top_p = 1 },
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
		{
			name = "CodeGPT-4o-Code",
			chat = false,
			command = true,
			-- string with model name or table with model name and parameters
			model = { model = "gpt-4o", temperature = 0.8, top_p = 1 },
			-- system prompt (use this to specify the persona/role of the AI)
			system_prompt = "You are an AI working as a code editor.\n\n"
				.. "Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n"
				.. "START AND END YOUR ANSWER WITH:\n\n```",
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
			local template = "I have the following bullet points from {{filename}}:\n\n"
				.. "```{{filetype}}\n{{selection}}\n```\n\n"
				.. "Please create a concise and unemotional text, including all the information from the text snipped."
			local agent = gp.get_command_agent()
			gp.Prompt(params, gp.Target.rewrite, agent, template)
		end,
		Description = function(gp, params)
			local template = "I have the following bullet points from {{filename}}:\n\n"
				.. "```{{filetype}}\n{{selection}}\n```\n\n"
				.. "Please create a short and concise description of the selected."
			local agent = gp.get_command_agent()
			gp.Prompt(params, gp.Target.rewrite, agent, template)
		end,
		Name = function(gp, params)
			local template = "I have the following bullet points from {{filename}}:\n\n"
				.. "```{{filetype}}\n{{selection}}\n```\n\n"
				.. "Please create a descriptiv name for the selected function, variable, context or paragraph."
			local agent = gp.get_command_agent()
			gp.Prompt(params, gp.Target.rewrite, agent, template)
		end,
		Spelling = function(gp, params)
			local template = "I have the following bullet points from {{filename}}:\n\n"
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
	},
})

-- VISUAL mode mappings
-- s, x, v modes are handled the same way by which_key
require("which-key").add({

	{
		mode = { "v" },
		{ "<C-g>R", ":<C-u>'<,'>GpCodeReview<cr>", desc = "Review selection", nowait = true, remap = false },
		{ "<C-g>a", ":<C-u>'<,'>GpAppend<cr>", desc = "Visual Append (after)", nowait = true, remap = false },
		{ "<C-g>b", ":<C-u>'<,'>GpPrepend<cr>", desc = "Visual Prepend (before)", nowait = true, remap = false },
		{ "<C-g>c", ":<C-u>'<,'>GpAddComments<cr>", desc = "Add comments to selection", nowait = true, remap = false },
		{ "<C-g>s", ":<C-u>'<,'>GpSummarize<cr>", desc = "Summarize selection", nowait = true, remap = false },
		{ "<C-g>S", ":<C-u>'<,'>GpShorten<cr>", desc = "Shorten selection", nowait = true, remap = false },
		{ "<C-g>T", ":<C-u>'<,'>GpInfoToText<cr>", desc = "Information to text", nowait = true, remap = false },
		{ "<C-g>C", ":<C-u>'<,'>GpSpelling<cr>", desc = "Correct spelling", nowait = true, remap = false },
		{ "<C-g>e", ":<C-u>'<,'>GpExplain<cr>", desc = "Explain selection", nowait = true, remap = false },
		{ "<C-g>d", ":<C-u>'<,'>GpDescription<cr>", desc = "Short Description", nowait = true, remap = false },
		{ "<C-g>n", ":<C-u>'<,'>GpName<cr>", desc = "Name selection ", nowait = true, remap = false },
		{ "<C-g>g", group = "generate into new ..", nowait = true, remap = false },
		{ "<C-g>ge", ":<C-u>'<,'>GpEnew<cr>", desc = "Visual GpEnew", nowait = true, remap = false },
		{ "<C-g>gn", ":<C-u>'<,'>GpNew<cr>", desc = "Visual GpNew", nowait = true, remap = false },
		{ "<C-g>gp", ":<C-u>'<,'>GpPopup<cr>", desc = "Visual Popup", nowait = true, remap = false },
		{ "<C-g>gt", ":<C-u>'<,'>GpTabnew<cr>", desc = "Visual GpTabnew", nowait = true, remap = false },
		{ "<C-g>gv", ":<C-u>'<,'>GpVnew<cr>", desc = "Visual GpVnew", nowait = true, remap = false },
		{ "<C-g>i", ":<C-u>'<,'>GpImplement<cr>", desc = "Implement selection", nowait = true, remap = false },
		{ "<C-g>r", ":<C-u>'<,'>GpRewrite<cr>", desc = "Visual Rewrite", nowait = true, remap = false },
	},
})

-- NORMAL mode mappings
require("which-key").add({

	{
		{ "<C-g>N", "<cmd>GpNextAgent<cr>", desc = "Next Agent", nowait = true, remap = false },
		{ "<C-g>S", "<cmd>GpStop<cr>", desc = "GpStop", nowait = true, remap = false },
		{ "<C-g>t", "<cmd>GpChatToggle split<cr>", desc = "Toggle Chat", nowait = true, remap = false },
		{ "<C-g>w", group = "Whisper", nowait = true, remap = false },
		{ "<C-g>wa", "<cmd>GpWhisperAppend<cr>", desc = "Whisper Append (after)", nowait = true, remap = false },
		{ "<C-g>wb", "<cmd>GpWhisperPrepend<cr>", desc = "Whisper Prepend (before)", nowait = true, remap = false },
		{ "<C-g>we", "<cmd>GpWhisperEnew<cr>", desc = "Whisper Enew", nowait = true, remap = false },
		{ "<C-g>wn", "<cmd>GpWhisperNew<cr>", desc = "Whisper New", nowait = true, remap = false },
		{ "<C-g>wp", "<cmd>GpWhisperPopup<cr>", desc = "Whisper Popup", nowait = true, remap = false },
		{ "<C-g>wr", "<cmd>GpWhisperRewrite<cr>", desc = "Whisper Inline Rewrite", nowait = true, remap = false },
		{ "<C-g>wt", "<cmd>GpWhisperTabnew<cr>", desc = "Whisper Tabnew", nowait = true, remap = false },
		{ "<C-g>wv", "<cmd>GpWhisperVnew<cr>", desc = "Whisper Vnew", nowait = true, remap = false },
		{ "<C-g>ww", "<cmd>GpWhisper<cr>", desc = "Whisper", nowait = true, remap = false },
		{ "<C-g>x", "<cmd>GpContext<cr>", desc = "Toggle GpContext", nowait = true, remap = false },
	},
})
