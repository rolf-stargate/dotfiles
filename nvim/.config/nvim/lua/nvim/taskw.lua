local function create_task()
  local current_line = vim.fn.line('.')

  local home = vim.fn.getenv("HOME")
  local path = vim.fn.expand('%:p')
  local general_path = path:gsub("^" .. home, "$HOME")

  -- create task and annotate it with the current file and line in the format
  -- <line>:<file>
  -- this will be used by a custom action created for taskopen and defined in the 
  -- .taskopenrc file, to open the file at the line where the task was created
  local cmd = 'task add  ' .. ' && task +LATEST annotate ' .. current_line .. ':' .. general_path

  -- the terminal is used to have completion for tags, projects ...
  -- 
  vim.cmd("new | terminal")
  local buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_input('i' .. cmd)
  for i = 1, 500 do
    vim.api.nvim_input('<left>')
  end
  for i = 1, 9 do
    vim.api.nvim_input('<right>')
  end

end

vim.api.nvim_create_user_command('CreateTask', create_task, {nargs = '?'})

vim.api.nvim_set_keymap('n', '<leader>ct', ':CreateTask<CR>', {noremap = true, silent = true})
