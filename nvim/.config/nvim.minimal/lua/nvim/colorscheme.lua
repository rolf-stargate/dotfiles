local colorscheme = "stargate"

function MyFoldText()
	local indent_depth = Get_indent_depth()
	local fill_char = "<"
	local first_line = vim.fn.getline(vim.v.foldstart)
	if vim.fn.strdisplaywidth(first_line) > 15 then
		first_line = first_line:sub(1, 15) .. "..."
	else
		first_line = Fill_between_with_char(18, first_line, "", " ", 0)
	end
	local end_text = "<<<<<<<<<<<<"
	local banner = "(>^.^)> コード " .. first_line .. " ド折りたたみ <(^.^<)"
	local banner_length = vim.fn.strdisplaywidth(banner)
	if banner_length % 2 ~= 0 then
		banner_length = banner_length + 1
	end
	local banner_half = banner_length / 2
	local start_end_length = 40 - banner_half
	local fold_line_count = vim.fn.foldclosedend(vim.v.foldstart) - vim.fn.foldclosed(vim.v.foldstart) + 1

	local _start = Fill_between_with_char(start_end_length, ">", "<", "<", indent_depth)
	local _end = Fill_between_with_char(start_end_length, ">", fold_line_count .. "<", ">", 0)
	return _start .. banner .. _end
end

vim.o.statuscolumn = "%=%l%s%C"
vim.opt.foldtext = "v:lua.MyFoldText()"
vim.opt.fillchars:append({ fold = " " })
