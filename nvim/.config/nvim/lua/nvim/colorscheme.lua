local colorscheme = "stargate"
-- local colorscheme = "abscs"
-- local colorscheme = "neon"
-- vim.g.neon_style = "dark"
-- local colorscheme = "kat.nwim"

local wk = require("which-key")
wk.register({
	c = {
		name = "Color",
		d = { "<cmd>colorscheme stargate<cr><cmd>set background=dark<cr>", "Dark Colorscheme", noremap = true },
		l = { "<cmd>colorscheme kat.nvim<cr><cmd>set background=light<cr>", "Light Colorscheme", noremap = true },
	},
}, {
	mode = "n",
	prefix = "<Leader>",
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
end
