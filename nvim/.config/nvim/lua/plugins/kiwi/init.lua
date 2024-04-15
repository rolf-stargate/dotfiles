-- Setup Custom wiki path if required
require("kiwi").setup({
	{
		name = "Main",
		path = "/home/rolf/.config/nvim/wiki/",
	},
})

-- Use default path (i.e. ~/wiki/)
local kiwi = require("kiwi")

-- Necessary keybindings
vim.keymap.set("n", "<leader>ww", kiwi.open_wiki_index, {})
vim.keymap.set("n", "<leader>wt>", kiwi.todo.toggle, {})
