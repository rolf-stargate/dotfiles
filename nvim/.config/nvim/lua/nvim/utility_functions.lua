Get_window_width = function()
	local width = vim.fn.winwidth(0)
	return width
end

Get_window_height = function()
	local height = vim.fn.winheight(0)
	return height
end
