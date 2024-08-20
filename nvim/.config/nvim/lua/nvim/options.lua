local options = {
	backup = false, -- creates a backup file
	clipboard = "unnamedplus", -- sync system clipboard
	cmdheight = 1, -- neovim command line height
	completeopt = { "menuone", "noselect", "preview" }, -- has to do with autocompletion, check :h options
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	smartcase = true, -- smartcase
	mouse = "a", -- mouse use is allowed in every mode
	pumheight = 10, -- popup menu height
	showmode = false, -- don't show current mode
	smartindent = true, -- smartindent
	splitbelow = true, -- force all horizontal splits to be below
	splitright = true, -- force all vertical splits to be to the right
	swapfile = false, -- no swap files
	termguicolors = true, -- use gui colors
	timeoutlen = 1000, -- time to wait for a mapped sequence tom complete(millseconds)
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion(default is 4000ms)
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 2, -- number of spaces for indentation
	tabstop = 2, -- 2 spaces for tab
	cursorline = true, -- have a cursorline
	number = true, -- line numbers
	relativenumber = true, -- don't use relative numbers
	numberwidth = 2, -- number column width
	signcolumn = "yes:1", -- always show the sign column, otherwise it would shift the text each time
	wrap = true, -- text wrap if line is to long
	scrolloff = 8, -- when moving through the document, go up before the cursorline reaches the EOF
	inccommand = "", -- stop live substitution preview
	linebreak = true, -- wrap long lines but keep words intact
	title = true, -- set title of the window
	foldmethod = "indent", -- foldmethod
	foldlevel = 99, -- foldlevel
	wildignore = "*/node_modules/*", -- ignore node_modules in :vim
	spelllang = "en,de",
	spellsuggest = "fast",
}

vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
	pattern = { "*.*" },
	desc = "save view (folds), when closing file",
	command = "mkview",
})
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = { "*.*" },
	desc = "load view (folds), when opening file",
	command = "silent! loadview",
})

vim.g.nvimgdb_disable_start_keymaps = true

vim.cmd("let g:markdown_folding = 0")

vim.cmd("let g:python3_host_prog='/sbin/python3'")

vim.cmd([[
  autocmd FileType * setlocal formatoptions=jcrql
]])

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.opt.shortmess:append("c") -- shortens file messages for specifc things, check help for more info

vim.cmd("set whichwrap+=<,>,[,],h,l") -- allows specific keys to move to the next line if cursor is on BOL or EOL

vim.cmd("set iskeyword+=-") -- handle foo-bar as one word

vim.cmd("autocmd InsertEnter * set nocul")
vim.cmd("autocmd InsertLeave * set cul")
vim.cmd("autocmd InsertEnter * set cursorcolumn")
vim.cmd("autocmd InsertLeave * set nocursorcolumn")
