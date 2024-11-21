-- |////|__ UTILITY FUNCTIONS __|/////////////////////////////////////////|»)-->
-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- Get Window Width
Get_window_width = function()
	local width = vim.fn.winwidth(0)
	return width
end
-- Get Window Height
Get_window_height = function()
	local height = vim.fn.winheight(0)
	return height
end

-- Function to get the base name of the current buffer file
function Get_buffer_base_name()
	local file_path = vim.api.nvim_buf_get_name(0)
	local base_name = vim.fn.fnamemodify(file_path, ":r")
	return base_name
end

-- Get the current visual selection
-- Multiline not supported at the moment
function Get_visual_selection()
	local bufnr = vim.api.nvim_get_current_buf()
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")
	local start_row = start_pos[2] - 1
	local start_col = start_pos[3] - 1
	local end_row = end_pos[2] - 1
	local end_col = end_pos[3] - 1

	if start_row == end_row then
		return vim.api.nvim_buf_get_text(bufnr, start_row, start_col, end_row, end_col + 1, {})[1]
	else
		print("Multiline Selection Not Yet Implemented!")
		error("Multiline Selection Not Yet Implemented!")
		return 1
	end
end

-- Run shell command and return output as a table
function Get_cmd_output(cmd)
	local handle = io.popen(cmd)
	local result = handle:read("*a")
	handle:close()

	local lines = {}
	for line in result:gmatch("([^\n]*)\n?") do
		if line ~= "" then
			table.insert(lines, line)
		end
	end
	return lines
end

-- Append Line below current cursor
function Append_line_below(text)
	local buf = vim.api.nvim_get_current_buf()
	local cursor_pos = vim.api.nvim_win_get_cursor(0)
	local current_line = cursor_pos[1]
	vim.api.nvim_buf_set_lines(buf, current_line, current_line, false, { text })
end

-- Change to the directory of the buffer
-- Run a cmd and change back
function Change_to_buffer_dir_and_back(cmd)
	-- Get the full path of the current buffer
	local buffer_path = vim.fn.expand("%:p")
	-- Get the directory of the current buffer
	local buffer_dir = vim.fn.fnamemodify(buffer_path, ":h")
	-- Get the current working directory
	local current_dir = vim.fn.getcwd()
	-- Change to the buffer's directory
	vim.cmd("cd " .. buffer_dir)
	-- Execute the given command
	vim.cmd(cmd)
	-- Change back to the original directory
	vim.cmd("cd " .. current_dir)
end

-- Toggle horizontal split with height between 0 and 1
function Toggle_large_split(path, height)
	-- Get all windows in the current tab page
	local windows = vim.api.nvim_tabpage_list_wins(0)
	local window_count = #windows

	-- Calculate 90% of the total height
	local total_height = vim.o.lines
	local desired_height = math.floor(height * total_height)

	if window_count == 1 then
		-- The only window on screen, let's go ahead and open a large split
		vim.cmd("topleft " .. desired_height .. "split " .. path)
	else
		-- Calculate the current window height
		local current_window = vim.api.nvim_get_current_win()
		local current_height = vim.api.nvim_win_get_height(current_window)

		-- Toggle logic handling
		if current_height < desired_height then
			-- Resize to desired height
			vim.api.nvim_win_set_height(current_window, desired_height)
		else
			-- Close the split
			vim.cmd("q")
		end
	end
end
-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- <--(«|/////////////////////////////////////////|__ UTILITY FUNCTIONS __|////|
