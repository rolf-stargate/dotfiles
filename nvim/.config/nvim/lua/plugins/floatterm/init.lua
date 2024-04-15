vim.cmd("let g:floaterm_keymap_toggle = '<leader>ht'")
vim.cmd("let g:floaterm_keymap_kill = '<leader>hk'")

local get_width = function()
	local width = vim.fn.winwidth(0)
	return width
end

local get_height = function()
	local height = vim.fn.winheight(0)
	return height
end

local wk = require("which-key")

wk.register({
	h = {
		name = "Floterm",
		l = {
			":FloatermNew --autoclose=2 --width=" .. get_width() .. " --height=" .. get_height() .. " lazygit<CR>",
			"Lazygit",
			noremap = false,
		},
		t = {
			":FloatermToggle<CR>",
			"Terminal",
			noremap = false,
		},
	},
}, {
	mode = "n",
	prefix = "<Leader>",
})
