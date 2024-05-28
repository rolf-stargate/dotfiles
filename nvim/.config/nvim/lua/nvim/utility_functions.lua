Get_window_width = function()
	local width = vim.fn.winwidth(0)
	return width
end

Get_window_height = function()
	local height = vim.fn.winheight(0)
	return height
end

-- Function to get the base name of the current buffer file
function Get_buffer_base_name()
    local file_path = vim.api.nvim_buf_get_name(0)
    local base_name = vim.fn.fnamemodify(file_path, ':r')
    return base_name
end

function Change_to_buffer_dir_and_back(cmd)
    -- Get the full path of the current buffer
    local buffer_path = vim.fn.expand('%:p')
    -- Get the directory of the current buffer
    local buffer_dir = vim.fn.fnamemodify(buffer_path, ':h')
    -- Get the current working directory
    local current_dir = vim.fn.getcwd()

    -- Change to the buffer's directory
    vim.cmd('cd ' .. buffer_dir)

    -- Execute the given command
    vim.cmd(cmd)

    -- Change back to the original directory
    vim.cmd('cd ' .. current_dir)
end
