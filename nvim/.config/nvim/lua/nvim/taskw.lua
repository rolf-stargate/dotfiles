local function create_task()
  local task = vim.fn.input('task ')
  local current_file = vim.fn.expand('%')
  local current_line = vim.fn.line('.')

  -- create task and annotate it with the current file and line in the format
  -- <line>:<file>
  -- this will be used by a custom action created for taskopen and defined in the 
  -- .taskopenrc file, to open the file at the line where the task was created
  local cmd = 'task add ' .. task .. ' && task +LATEST annotate ' .. current_line .. ':' .. current_file

  local result = vim.fn.system(cmd)
  local success = vim.v.shell_error == 0

  if success then
    print('Task created: \n', result)
  else
    print('Error creating task: \n', result)
  end

end

vim.api.nvim_create_user_command('CreateTask', create_task, {nargs = '?'})

vim.api.nvim_set_keymap('n', '<leader>ct', ':CreateTask<CR>', {noremap = true, silent = true})
