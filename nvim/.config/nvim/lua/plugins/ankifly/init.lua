local wk = require("which-key")

wk.add({
	{
		{ "<Leader>a", group = "Anki" },
		{ "<Leader>ab", "<cmd>AnkiBasic<cr>", desc = "Create Basic Note", remap = false },
		{ "<Leader>ac", "<cmd>AnkiCloze<cr>", desc = "Create Cloze Note", remap = false },
		{ "<Leader>an", "<cmd>Anki<cr>", desc = "Create Note", remap = false },
		{ "<Leader>ar", "<cmd>AnkiReverse<cr>", desc = "Create Reverse Note", remap = false },
	},
})
