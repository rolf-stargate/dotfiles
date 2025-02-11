local nme = require("notmuch")
nme.setup({
	keys = {
		{ "NOTMUCH" },
		{
			"Message%-ID:",
			{
				search = "%s*%<([^%>]+)%>",
				query = "id:'%s'",
				notmuch = "id:'%s'",
			},
		},
	},
})

vim.api.nvim_set_hl(nme.ns, "EmailSubject", {
	fg = "#1AB5E3",
	bg = "#0F0016",
	bold = true,
})

vim.api.nvim_set_hl(nme.ns, "EmailAuthors", {
	fg = "#1AE3AC",
	bg = "#0F0016",
	bold = true,
})

vim.api.nvim_set_hl_ns(nme.ns)

local ne = require("notmuch")
ne.replaceMessageId()

vim.keymap.set("n", "<Leader>to", ne.openNeomutt, { noremap = true, desc = "Open neomutt with Message-ID query" })

vim.keymap.set("n", "<Leader>tO", ne.pickMail, { noremap = true, desc = "Open picker for all Mails" })
