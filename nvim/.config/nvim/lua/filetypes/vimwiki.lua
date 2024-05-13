vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "vimwiki",
  callback = function()
    local cmd = "task sync"
    local result = vim.fn.system(cmd)
    local exit_code = vim.v.shell_error

    if exit_code ~= 0 then
      print("Error executing command: " .. cmd )
    end
  end,
})
