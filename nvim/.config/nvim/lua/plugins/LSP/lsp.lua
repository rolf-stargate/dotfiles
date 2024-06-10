local lsp_zero = require('lsp-zero')

vim.diagnostic.config({
  virtual_text = false,
})

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
  vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', {buffer = bufnr})
end)

require('lspconfig').tsserver.setup({
  on_init = function(client)
    client.server_capabilities.semanticTokensProvider = nil
  end,
})

require('lspconfig').clangd.setup({
  cmd = { "clangd", "--background-index", "--fallback-style=gnu", "--offset-encoding=utf-16" },
})

lsp_zero.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['tsserver'] = {'javascript', 'typescript'},
    ['clangd'] = {'c'},
  }
})

lsp_zero.set_sign_icons({
  error = 'x',
  warn = 'w',
  hint = 'h',
  info = 'i'
})

