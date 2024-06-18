require("gp").setup({
  openai_api_key = { "cat", "/home/rolf/openai_key" },	
  toggle_target = "split",
  chat_user_prefix = "Rolf:",
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
        name = "CodeGPT-4o",
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
        gp.Prompt(params, gp.Target.new("markdown"), nil, agent.model, template, agent.system_prompt)
    end,
    AddComments = function(gp, params)
        local template = "I have the following code from {{filename}}:\n\n"
            .. "```{{filetype}}\n{{selection}}\n```\n\n"
            .. "Please add comments to the code but do not change it."
        local agent = gp.get_command_agent()
        gp.Prompt(params, gp.Target.rewrite, nil, agent.model, template, agent.system_prompt)
    end,
    Explain = function(gp, params)
        local template = "I have the following code from {{filename}}:\n\n"
            .. "```{{filetype}}\n{{selection}}\n```\n\n"
            .. "Please respond by explaining the code above."
        local agent = gp.get_chat_agent()
        gp.Prompt(params, gp.Target.new("markdown"), nil, agent.model, template, agent.system_prompt)
end,
  }
})

-- VISUAL mode mappings
-- s, x, v modes are handled the same way by which_key
require("which-key").register({
    ["<C-g>"] = {

        r = { ":<C-u>'<,'>GpRewrite<cr>", "Visual Rewrite" },
        a = { ":<C-u>'<,'>GpAppend<cr>", "Visual Append (after)" },
        b = { ":<C-u>'<,'>GpPrepend<cr>", "Visual Prepend (before)" },
        i = { ":<C-u>'<,'>GpImplement<cr>", "Implement selection" },
        e = { ":<C-u>'<,'>GpExplain<cr>", "Explain selection" },
        c = { ":<C-u>'<,'>GpAddComments<cr>", "Add comments to selection" },
        R = { ":<C-u>'<,'>GpCodeReview<cr>", "Review selection" },

        g = {
            name = "generate into new ..",
            p = { ":<C-u>'<,'>GpPopup<cr>", "Visual Popup" },
            e = { ":<C-u>'<,'>GpEnew<cr>", "Visual GpEnew" },
            n = { ":<C-u>'<,'>GpNew<cr>", "Visual GpNew" },
            v = { ":<C-u>'<,'>GpVnew<cr>", "Visual GpVnew" },
            t = { ":<C-u>'<,'>GpTabnew<cr>", "Visual GpTabnew" },
        },
    },
    -- ...
}, {
    mode = "v", -- VISUAL mode
    prefix = "",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
})

-- NORMAL mode mappings
require("which-key").register({
    -- ...
    ["<C-g>"] = {
        t = { "<cmd>GpChatToggle split<cr>", "Toggle Chat" },
        n = { "<cmd>GpChatNew split<cmd>GpChatToggle split<cr>", "Toggle Chat" },

        N = { "<cmd>GpNextAgent<cr>", "Next Agent" },
        s = { "<cmd>GpStop<cr>", "GpStop" },
        x = { "<cmd>GpContext<cr>", "Toggle GpContext" },

        w = {
            name = "Whisper",
            w = { "<cmd>GpWhisper<cr>", "Whisper" },
            r = { "<cmd>GpWhisperRewrite<cr>", "Whisper Inline Rewrite" },
            a = { "<cmd>GpWhisperAppend<cr>", "Whisper Append (after)" },
            b = { "<cmd>GpWhisperPrepend<cr>", "Whisper Prepend (before)" },
            p = { "<cmd>GpWhisperPopup<cr>", "Whisper Popup" },
            e = { "<cmd>GpWhisperEnew<cr>", "Whisper Enew" },
            n = { "<cmd>GpWhisperNew<cr>", "Whisper New" },
            v = { "<cmd>GpWhisperVnew<cr>", "Whisper Vnew" },
            t = { "<cmd>GpWhisperTabnew<cr>", "Whisper Tabnew" },
        },
    },
    -- ...
}, {
    mode = "n", -- NORMAL mode
    prefix = "",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
})
