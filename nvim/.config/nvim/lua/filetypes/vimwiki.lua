vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "vimwiki",
  callback = function()
    print("task sync")
    local cmd = "task sync"
    vim.fn.system(cmd)
    local exit_code = vim.v.shell_error

    if exit_code ~= 0 then
      print("Error executing command: " .. cmd )
    end
  end,
})
