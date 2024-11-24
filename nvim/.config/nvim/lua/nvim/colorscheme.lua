local colorscheme = "stargate"
-- local colorscheme = "abscs"
-- local colorscheme = "neon"
-- vim.g.neon_style = "dark"
-- local colorscheme = "kat.nwim"

local wk = require("which-key")
wk.add({
	{
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
	},
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
end

function MyFoldText()
	local indent_depth = Get_indent_depth()
	local fill_char = "<"
	local first_line = vim.fn.getline(vim.v.foldstart)
	if vim.fn.strdisplaywidth(first_line) > 14 then
		first_line = first_line:sub(1, 14) .. "..."
	end
	local start_text = ">"
	local end_text = string.rep(" ", indent_depth)
		.. "(>^.^)> コード "
		.. first_line
		.. " ド折りたたみ <(^.^<)"

	local fold_line = Fill_between_with_char(80, start_text, end_text, fill_char, indent_depth)
	return fold_line
end

vim.opt.foldtext = "v:lua.MyFoldText()"
vim.opt.fillchars:append({ fold = " " })
