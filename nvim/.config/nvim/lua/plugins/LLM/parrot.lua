require("parrot").setup({
	providers = {
		openai = {
			api_key = os.getenv("OPENAI_API_KEY"),
		},
		ollama = {},
		deepseek = {
			style = "openai",
			api_key = os.getenv("DEEPSEEK_API_KEY"),
			endpoint = "https://api.deepseek.com",
			models = {
				"deepseek-chat",
				"deepseek-reasoner",
			},
			-- parameters to summarize chat
			-- topic = {
			-- 	model = "DeepSeekV1",
			-- 	params = { max_completion_tokens = 64 },
			-- },
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
		ShortDescription = function(prt, params)
			local template = [[
        Your task is to write a short description of the selected text. Be
        precise, descriptive, and concise. Focus on capturing the key points
        and main ideas while maintaining clarity and brevity. Ensure the
        description is well-structured and easy to understand.

        Provided text:
        ```{{selection}}`
      ]]
			local model_obj = prt.get_model("command")
			prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
		end,
		VimwikiTags = function(prt, params)
			local pwd = vim.fn.getcwd()
			local cmd = "find "
				.. pwd
				.. " -maxdepth 1 -type f | xargs -n 1 grep -oE ':[a-z0-9]+:' | tr -d ':' | sort | uniq | paste -d: -s"

			local handle = io.popen(cmd)
			local tags = handle:read("*a")
			handle:close()

			local template = [[
        Your first task is to compare an existing list of tags with content of a file
        and find the best matching tags. Only use tags that are clearly describing
        the content of the file!
        If you can't find any fitting tags in the existing list, create you own.

        Return them in the following format:

        :existing_tag1:existing_tag2:existing_tag3:existing_tagN:
        :new_tag1:new_tag2:new_tag3:new_tag4:new_tagN:


        File Content:
        ```{{filecontent}}```

        Existing Tags:
        ]] .. tags
			local model_obj = prt.get_model("command")
			prt.Prompt(params, prt.ui.Target.popup, model_obj, nil, template)
		end,
		SpellCheckSelection = function(prt, params)
			local template = [[
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
		SpellCheckFile = function(prt, params)
			local template = [[
        Your task is to take the text provided and rewrite it into a clear,
        grammatically correct version while preserving the original meaning
        as closely as possible. Correct any spelling mistakes, punctuation
        errors, verb tense issues, word choice problems, and other
        grammatical mistakes.

        Provided text:
        ```{{filecontent}}`
      ]]
			local model_obj = prt.get_model("command")
			prt.Prompt(params, prt.ui.Target.new, model_obj, nil, template)
		end,
		StructureCode = function(prt, params)
			local template = [[

I have some code from the file `{{filename}}` written in `{{filetype}}`. The snippet is as follows:

```{{filetype}}
{{filecontent}}
```

I need your help to organize this code into logical sections. Sections may be nested, and each should start and end with a unique comment line using the appropriate syntax for `{{filetype}}`. Please follow these formatting templates based on section levels:

#### Template: Top Level Section
```filetype
{{comment_syntax}} |////|_ SECTION_NAME _|//////////////////////////////////////|
    code...
{{comment_syntax}} |////////////////////////////////////|_ »SECTION_NAME« _|////|
```

#### Template: Second Level Section
```filetype
{{comment_syntax}} ======: SECTION_NAME :========================================
    code...
{{comment_syntax}} ======================================: »SECTION_NAME« :======
```

#### Template: Third Level Section
```filetype
{{comment_syntax}} ------: SECTION_NAME :----------------------------------------
    code...
{{comment_syntax}} --------------------------------------: »SECTION_NAME« :------
```

### Additional Guidelines
- Replace `{{comment_syntax}}` with the correct comment notation for the file type (e.g., `#` for Python, `//` for JavaScript).
- For `SECTION_NAME`, use uppercase letters and underscores for spaces.
- Ensure all comment lines extend to the 80th column.
- Consider code indentation when determining the length of the filler characters (`/`, `=`, or `-`).
- At the start of a section, vary the number of filler characters after `SECTION_NAME` based on the indentation level of the section.
- At the end of a section, adjust the number of filler characters before `SECTION_NAME` to precisely align the comment line to the 80th column, accounting for the indentation.
      ]]
			local model_obj = prt.get_model("command")
			prt.Prompt(params, prt.ui.Target.new, model_obj, nil, template)
		end,
		Complete = function(prt, params)
			local template = [[
        I have the following code from {{filename}}:

        ```{{filetype}}
        {{selection}}
        ```

        Please finish the code above carefully and logically.
        Respond just with the snippet of code that should be inserted."
        ]]
			local model_obj = prt.get_model("command")
			prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
		end,
		CompleteFullContext = function(prt, params)
			local template = [[
        I have the following code from {{filename}}:

        ```{{filetype}}
        {{filecontent}}
        ```

        Please look at the following section specifically:
        ```{{filetype}}
        {{selection}}
        ```

        Please finish the code above carefully and logically.
        Respond just with the snippet of code that should be inserted.
        ]]
			local model_obj = prt.get_model("command")
			prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
		end,
		CompleteMultiContext = function(prt, params)
			local template = [[
        I have the following code from {{filename}} and other realted files:

        ```{{filetype}}
        {{multifilecontent}}
        ```

        Please look at the following section specifically:
        ```{{filetype}}
        {{selection}}
        ```

        Please finish the code above carefully and logically.
        Respond just with the snippet of code that should be inserted.
        ]]
			local model_obj = prt.get_model("command")
			prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
		end,
		Explain = function(prt, params)
			local template = [[
        Your task is to take the code snippet from {{filename}} and explain it with gradually increasing complexity.
        Break down the code's functionality, purpose, and key components.
        The goal is to help the reader understand what the code does and how it works.

        ```{{filetype}}
        {{selection}}
        ```

        Use the markdown format with codeblocks and inline code.
        Explanation of the code above:
        ]]
			local model = prt.get_model("command")
			prt.logger.info("Explaining selection with model: " .. model.name)
			prt.Prompt(params, prt.ui.Target.new, model, nil, template)
		end,
		FixBugs = function(prt, params)
			local template = [[
        You are an expert in {{filetype}}.
        Fix bugs in the below code from {{filename}} carefully and logically:
        Your task is to analyze the provided {{filetype}} code snippet, identify
        any bugs or errors present, and provide a corrected version of the code
        that resolves these issues. Explain the problems you found in the
        original code and how your fixes address them. The corrected code should
        be functional, efficient, and adhere to best practices in
        {{filetype}} programming.

        ```{{filetype}}
        {{selection}}
        ```

        Fixed code:
        ]]
			local model_obj = prt.get_model("command")
			prt.logger.info("Fixing bugs in selection with model: " .. model_obj.name)
			prt.Prompt(params, prt.ui.Target.new, model_obj, nil, template)
		end,
		Optimize = function(prt, params)
			local template = [[
        You are an expert in {{filetype}}.
        Your task is to analyze the provided {{filetype}} code snippet and
        suggest improvements to optimize its performance. Identify areas
        where the code can be made more efficient, faster, or less
        resource-intensive. Provide specific suggestions for optimization,
        along with explanations of how these changes can enhance the code's
        performance. The optimized code should maintain the same functionality
        as the original code while demonstrating improved efficiency.

        ```{{filetype}}
        {{selection}}
        ```

        Optimized code:
        ]]
			local model_obj = prt.get_model("command")
			prt.logger.info("Optimizing selection with model: " .. model_obj.name)
			prt.Prompt(params, prt.ui.Target.new, model_obj, nil, template)
		end,
		UnitTests = function(prt, params)
			local template = [[
        I have the following code from {{filename}}:

        ```{{filetype}}
        {{selection}}
        ```

        Please respond by writing table driven unit tests for the code above.
        ]]
			local model_obj = prt.get_model("command")
			prt.logger.info("Creating unit tests for selection with model: " .. model_obj.name)
			prt.Prompt(params, prt.ui.Target.enew, model_obj, nil, template)
		end,
		Debug = function(prt, params)
			local template = [[
        I want you to act as {{filetype}} expert.
        Review the following code, carefully examine it, and report potential
        bugs and edge cases alongside solutions to resolve them.
        Keep your explanation short and to the point:

        ```{{filetype}}
        {{selection}}
        ```
        ]]
			local model_obj = prt.get_model("command")
			prt.logger.info("Debugging selection with model: " .. model_obj.name)
			prt.Prompt(params, prt.ui.Target.enew, model_obj, nil, template)
		end,
		CommitMsg = function(prt, params)
			local futils = require("parrot.file_utils")
			if futils.find_git_root() == "" then
				prt.logger.warning("Not in a git repository")
				return
			else
				local template = [[
          I want you to act as a commit message generator. I will provide you
          with information about the task and the prefix for the task code, and
          I would like you to generate an appropriate commit message using the
          conventional commit format. Do not write any explanations or other
          words, just reply with the commit message.
          Start with a short headline as summary but then list the individual
          changes in more detail.

          Here are the changes that should be considered by this message:
          ]] .. vim.fn.system("git diff --no-color --no-ext-diff --staged")
				local model_obj = prt.get_model("command")
				prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
			end
		end,
		SpellCheck = function(prt, params)
			local chat_prompt = [[
        Your task is to take the text provided and rewrite it into a clear,
        grammatically correct version while preserving the original meaning
        as closely as possible. Correct any spelling mistakes, punctuation
        errors, verb tense issues, word choice problems, and other
        grammatical mistakes.
        ]]
			prt.ChatNew(params, chat_prompt)
		end,
		CodeConsultant = function(prt, params)
			local chat_prompt = [[
          Your task is to analyze the provided {{filetype}} code and suggest
          improvements to optimize its performance. Identify areas where the
          code can be made more efficient, faster, or less resource-intensive.
          Provide specific suggestions for optimization, along with explanations
          of how these changes can enhance the code's performance. The optimized
          code should maintain the same functionality as the original code while
          demonstrating improved efficiency.

          Here is the code
          ```{{filetype}}
          {{filecontent}}
          ```
        ]]
			prt.ChatNew(params, chat_prompt)
		end,
		ProofReader = function(prt, params)
			local chat_prompt = [[
        I want you to act as a proofreader. I will provide you with texts and
        I would like you to review them for any spelling, grammar, or
        punctuation errors. Once you have finished reviewing the text,
        provide me with any necessary corrections or suggestions to improve the
        text. Highlight the corrected fragments (if any) using markdown backticks.

        When you have done that subsequently provide me with a slightly better
        version of the text, but keep close to the original text.

        Finally provide me with an ideal version of the text.

        Whenever I provide you with text, you reply in this format directly:

        ## Corrected text:

        {corrected text, or say "NO_CORRECTIONS_NEEDED" instead if there are no corrections made}

        ## Slightly better text

        {slightly better text}

        ## Ideal text

        {ideal text}
        ]]
			prt.ChatNew(params, chat_prompt)
		end,
	},
})
vim.keymap.set("n", "<leader>gg", ":PrtChatRespond<cr>", {
	noremap = true,
	silent = true,
	desc = "Chat Respond",
})

vim.keymap.set("n", "<leader>gt", ":PrtChatToggle<cr>", {
	noremap = true,
	silent = true,
	desc = "Chat Toggle",
})

vim.keymap.set("n", "<leader>gx", ":PrtChatStop<cr>", {
	noremap = true,
	silent = true,
	desc = "Chat Stop",
})

vim.keymap.set("n", "<leader>g.", ":PrtRetry<cr>", {
	noremap = true,
	silent = true,
	desc = "Chat Repeat Last Rewrite/Append/Prepend",
})

vim.keymap.set("n", "<leader>gf", ":PrtChatFinder<cr>", {
	noremap = true,
	silent = true,
	desc = "Fuzzy Chat Files",
})

vim.keymap.set("n", "<leader>gd", ":PrtChatDelete<cr>", {
	noremap = true,
	silent = true,
	desc = "Chat Delete",
})

vim.keymap.set("n", "<leader>gsp", ":PrtProvider<cr>", {
	noremap = true,
	silent = true,
	desc = "Chat Select Provider",
})

vim.keymap.set("n", "<leader>gsm", ":PrtModel<cr>", {
	noremap = true,
	silent = true,
	desc = "Chat Select Model",
})

vim.keymap.set("v", "<leader>gp", ":PrtChatPaste<cr>", {
	noremap = true,
	silent = true,
	desc = "Chat Paste Visual Selection",
})

vim.keymap.set("v", "<leader>gr", ":PrtRewrite<cr>", {
	noremap = true,
	silent = true,
	desc = "Chat Rewrite Visual Selection",
})

vim.keymap.set("v", "<leader>ge", ":PrtEdit<cr>", {
	noremap = true,
	silent = true,
	desc = "Chat Edit Visual Selection",
})

vim.keymap.set("v", "<leader>ga", ":PrtAppend<cr>", {
	noremap = true,
	silent = true,
	desc = "Chat Append Visual Selection",
})

vim.keymap.set("v", "<leader>gA", ":PrtPrepend<cr>", {
	noremap = true,
	silent = true,
	desc = "Chat Prepend Visual Selection",
})
