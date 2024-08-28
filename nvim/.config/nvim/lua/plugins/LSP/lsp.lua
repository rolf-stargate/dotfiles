local lsp_zero = require("lsp-zero")

vim.diagnostic.config({
	virtual_text = false,
})

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
	vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", { buffer = bufnr })
	vim.keymap.set("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", { buffer = bufnr })
	vim.keymap.set("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { buffer = bufnr })
	vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { buffer = bufnr })
	vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { buffer = bufnr })
end)

require("lspconfig").bashls.setup({
	cmd = { "bash-language-server", "start" },
	filetypes = { "sh", "bash" },
})

local vue_typescript_plugin = "/home/rolf/.nvm/versions/node/v17.9.1"
	.. "/lib/node_modules"
	.. "/@vue/language-server/node_modules"
	.. "@vue/typescript-plugin"

require("lspconfig").tsserver.setup({
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = vue_typescript_plugin,
				languages = { "javascript", "typescript", "vue" },
			},
		},
	},
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"vue",
	},
})

require("lspconfig").volar.setup({
	cmd = { "vue-language-server", "--stdio" },
	filetypes = { "vue" },
})

require("lspconfig").clangd.setup({
	cmd = { "clangd", "--offset-encoding=utf-16" },
	filetypes = { "c", "cpp" },
})

lsp_zero.format_on_save({
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		["tsserver"] = { "javascript", "typescript" },
		["clangd"] = { "c" },
	},
})

lsp_zero.set_sign_icons({
	error = "x",
	warn = "w",
	hint = "h",
	info = "i",
})

lsp_zero.set_server_config({
	on_init = function(client)
		client.server_capabilities.semanticTokensProvider = nil
	end,
})
