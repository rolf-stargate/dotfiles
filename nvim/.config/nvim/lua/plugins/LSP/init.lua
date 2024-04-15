local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- Surpress warnings
local notify = vim.notify
vim.notify = function(msg, ...)
	if msg:match("warning: multiple different client offset_encodings") then
		return
	end

	notify(msg, ...)
end

require("plugins.LSP.mason")
require("plugins.LSP.handlers").setup()
require("plugins.LSP.null-ls")
require("plugins.LSP.cmp")
