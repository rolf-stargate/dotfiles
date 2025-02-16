vim.keymap.set(
	"n",
	"<leader>sc",
	":lua require('sc-im').open_in_scim()<cr>",
	{ noremap = true, desc = "Open table in sc-im" }
)
vim.keymap.set(
	"n",
	"<leader>sl",
	":lua require('sc-im').open_in_scim(true)<cr>",
	{ noremap = true, desc = "Open table in sc-im" }
)
vim.keymap.set(
	"n",
	"<leader>sp",
	":lua require('sc-im').open_in_scim(false)<cr>",
	{ noremap = true, desc = "Open plain table in sc-im" }
)
vim.keymap.set(
	"n",
	"<leader>st",
	":lua require('sc-im').toggle(true)<cr>",
	{ noremap = true, desc = "Toggle sc-im link format" }
)
vim.keymap.set(
	"n",
	"<leader>sr",
	":lua require('sc-im').rename()<cr>",
	{ noremap = true, desc = "Rename linked sc-im file" }
)
vim.keymap.set(
	"n",
	"<leader>su",
	":lua require('sc-im').update()<cr>",
	{ noremap = true, desc = "Recalculate Markdown table" }
)
vim.keymap.set(
	"n",
	"<leader>sU",
	":lua require('sc-im').update(true)<cr>",
	{ noremap = true, desc = "Update sc file and Markdown table" }
)

vim.keymap.set(
	"t",
	"<leader>sc",
	[[<esc>:w<cr><C-\><C-n>:lua require('sc-im').close()<CR>]],
	{ noremap = true, silent = true }
)

require("sc-im").setup({
	ft = "scim",
	include_sc_file = true,
	update_sc_from_md = true,
	link_fmt = 1,
	split = "floating",
	highlight = {
		enabled = false,
	},
	float_config = {
		height = 0.9,
		width = 0.9,
		style = "minimal",
		border = "single",
		hl = "Normal",
		blend = 0,
	},
})
