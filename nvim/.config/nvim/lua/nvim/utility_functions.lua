-- |////|__ UTILITY FUNCTIONS __|/////////////////////////////////////////|»)-->
-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

-- Generate UUID
function Gen_uuid(len) --> random string with length len
	local char_set = {}
	for c = 48, 57 do
		table.insert(char_set, string.char(c))
	end -- 0-9
	for c = 65, 90 do
		table.insert(char_set, string.char(c))
	end -- A-Z
	for c = 97, 122 do
		table.insert(char_set, string.char(c))
	end -- a-z

	local uuid = {}
	for i = 1, len do
		local rand_index = math.random(#char_set)
		table.insert(uuid, char_set[rand_index])
	end
	return table.concat(uuid)
end

-- Add Leading Zeros
function Add_leading_zeros(num, length) --> "00034" --> if no 0 needed -->  num as str
	local num_str = tostring(num)
	local zeros_needed = length - #num_str
	if zeros_needed > 0 then
		return string.rep("0", zeros_needed) .. num_str
	end
	return num_str
end

-- Get Window Width
Get_window_width = function() --> num
	local width = vim.fn.winwidth(0)
	return width
end
-- Get Window Height
Get_window_height = function()
	local height = vim.fn.winheight(0)
	return height
end

-- Function to get the base name of the current buffer file
function Get_buffer_base_name() --> num
	local file_path = vim.api.nvim_buf_get_name(0)
	local base_name = vim.fn.fnamemodify(file_path, ":r")
	return base_name
end

function Get_visual_selection() --> continous string with \n
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")
	local lines = vim.fn.getline(start_pos[2], end_pos[2])
	print("penis")
	print(lines)

	if #lines == 0 then
		return ""
	end

	-- Handle multi-line selection
	if #lines > 1 then
		lines[#lines] = string.sub(lines[#lines], 1, end_pos[3])
		lines[1] = string.sub(lines[1], start_pos[3])
	else
		lines[1] = string.sub(lines[1], start_pos[3], end_pos[3])
	end

	return table.concat(lines, "\n")
end

function Save_table_as_lines_to_tmp_file(tabl, filename) --> absolute path
	local path = "/tmp/" .. filename
	local file = io.open(path, "w")
	if not file then
		print("Error: Could not open file " .. path)
		return
	end

	for _, line in ipairs(tabl) do
		file:write(line .. "\n")
	end
	file:close()
	print("Saved matches to " .. path)
	return path
end

function Save_string_to_tmp_file(str, filename) --> absolute path
	local path = "/tmp/" .. filename
	local file = io.open(path, "w")
	if not file then
		print("Error: Could not open file " .. path)
		return
	end

	file:write(str)
	file:close()

	print("Saved matches to " .. path)
	return path
end

-- Run shell command and return output as a table
function Get_cmd_output(cmd) --> table[#lines] or empty table
	local handle = io.popen(cmd)
	handle:close()
	local result = handle:read("*a")

	local lines = {}
	for line in result:gmatch("([^\n]*)\n?") do
		if line ~= "" then
			table.insert(lines, line)
		end
	end
	return lines
end

-- Append Line below current cursor
function Append_line_below(text) --> void
	local buf = vim.api.nvim_get_current_buf()
	local cursor_pos = vim.api.nvim_win_get_cursor(0)
	local current_line = cursor_pos[1]
	vim.api.nvim_buf_set_lines(buf, current_line, current_line, false, { text })
end

-- Change to the directory of the buffer
-- Run a cmd and change back
function Change_to_buffer_dir_and_back(cmd) --> void
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

-- Create auto closing buffer
function Create_temporay_horizontal_split(height, path, keymap_close) --> void
	keymap_close = keymap_close or "<leader>qq"
	-- Create and move to a new split if corrected height is required
	vim.cmd("botright " .. height .. "split " .. path)
	vim.cmd("wincmd j") -- move cursor to the newly created split

	-- Get current buffer in the new split
	local buf = vim.api.nvim_get_current_buf()

	-- Close with <leader>TT
	vim.api.nvim_buf_set_keymap(buf, "n", keymap_close, ":wq<CR>", { noremap = true, silent = true })
	-- Or leaving the buffer
	vim.api.nvim_create_autocmd("BufLeave", {
		buffer = buf,
		callback = function()
			vim.cmd("update") -- Saves the buffer if there are any changes
			local win_ids = vim.fn.win_findbuf(buf)
			if win_ids and #win_ids > 0 then
				vim.api.nvim_win_close(win_ids[1], true)
			end
		end,
	})
end

-- Toggle horizontal split with height between 0 and 1
function Toggle_large_split(path, height) --> void
	-- Get all windows in the current tab page
	local windows = vim.api.nvim_tabpage_list_wins(0)
	local window_count = #windows

	-- Calculate 90% of the total height
	local total_height = vim.o.lines
	local desired_height = math.floor(height * total_height)

	if window_count == 1 then
		Create_temporay_horizontal_split(desired_height, path, "<leader>TT")
	else
		-- Determine current window height
		local current_window = vim.api.nvim_get_current_win()
		local current_height = vim.api.nvim_win_get_height(current_window)

		if current_height ~= desired_height then
			Create_temporay_horizontal_split(desired_height, path, "<leader>TT")
		else
			-- If already a split at desired height, just close it
			for _, win in ipairs(windows) do
				local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
				if bufname == path then
					vim.cmd("q") -- close split holding the path file
					return
				end
			end
		end
	end
end

-- Helper function to determine indentation level (optional step if indentation
-- matters)
function Get_indent_depth() --> number
	local cursor = vim.api.nvim_win_get_cursor(0)
	local line = vim.api.nvim_get_current_line()
	return vim.fn.indent(cursor[1])
end

-- Function to compute padding length between start and end text
function Fill_between_with_char(target_length, start_text, end_text, fill_char, indent_length)
	local total_length = target_length - indent_length
	local start_length = vim.fn.strdisplaywidth(start_text)
	local end_length = vim.fn.strdisplaywidth(end_text)
	local current_length = start_length + end_length

	local fill_length = total_length - current_length
	return start_text .. string.rep(fill_char, fill_length) .. end_text
end

-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- <--(«|/////////////////////////////////////////|__ UTILITY FUNCTIONS __|////|
