local wk = require("which-key")

wk.register({
	a = {
		name = "Anki",
		n = { "<cmd>Anki<cr>", "Create Note", noremap = true },
		c = { "<cmd>AnkiCloze<cr>", "Create Cloze Note", noremap = true },
		b = { "<cmd>AnkiBasic<cr>", "Create Basic Note", noremap = true },
	},
}, {
	mode = "n",
	prefix = "<Leader>",
})
