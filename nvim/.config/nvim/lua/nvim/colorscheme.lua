local colorscheme = "stargate"
-- local colorscheme = "abscs"
-- local colorscheme = "neon"
-- vim.g.neon_style = "dark"
-- local colorscheme = "kat.nwim"

local wk = require("which-key")
wk.register({

	{ "<Leader>c", group = "Color" },
	{
		"<Leader>cd",
		"<cmd>colorscheme stargate<cr><cmd>set background=dark<cr>",
		desc = "Dark Colorscheme",
		remap = false,
	},
	{
		"<Leader>cl",
		"<cmd>colorscheme kat.nvim<cr><cmd>set background=light<cr>",
		desc = "Light Colorscheme",
		remap = false,
	},
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
end
