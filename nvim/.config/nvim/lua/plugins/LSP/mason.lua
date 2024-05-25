local servers = {
  "lua_ls",
  "pyright",
  "jsonls",
  "volar",
  "tsserver",
  "emmet_ls",
  -- "marksman",
  "rust_analyzer",
  "graphql",
  "eslint",
  "html",
  "clangd",
}

local settings = {
  ui = {
    border = "none",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {
}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("plugins.LSP.handlers").on_attach,
    capabilities = require("plugins.LSP.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  local require_ok, conf_opts = pcall(require, "plugins.LSP.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  lspconfig[server].setup(opts)
end

local lsp = require('lspconfig')
lsp.lua_ls.setup {
  on_attach = function(client, bufnr)
    -- Opt out of semantic token highlighting.
    client.server_capabilities.semanticTokensProvider = nil
end,
-- rest of the config.
}
