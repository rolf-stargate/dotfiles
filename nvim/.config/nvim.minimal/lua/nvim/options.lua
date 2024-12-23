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
	foldmethod = "manual", -- foldmethod
	foldlevel = 99, -- foldlevel
	wildignore = "*/node_modules/*", -- ignore node_modules in :vim
	spelllang = "en,de",
	spellsuggest = "fast",
	spelllang = "en,de",
	colorcolumn = "81",
	statuscolumn = "%=%l%s%C", -- Status column order
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

function MyFoldText()
	local indent_depth = Get_indent_depth()
	local fill_char = "<"
	local first_line = vim.fn.getline(vim.v.foldstart)
	if vim.fn.strdisplaywidth(first_line) > 15 then
		first_line = first_line:sub(1, 15) .. "..."
	else
		first_line = Fill_between_with_char(18, first_line, "", " ", 0)
	end
	local end_text = "<<<<<<<<<<<<"
	local banner = "(>^.^)> コード " .. first_line .. " ド折りたたみ <(^.^<)"
	local banner_length = vim.fn.strdisplaywidth(banner)
	if banner_length % 2 ~= 0 then
		banner_length = banner_length + 1
	end
	local banner_half = banner_length / 2
	local start_end_length = 40 - banner_half
	local fold_line_count = vim.fn.foldclosedend(vim.v.foldstart) - vim.fn.foldclosed(vim.v.foldstart) + 1

	local _start = Fill_between_with_char(start_end_length, ">", "<", "<", indent_depth)
	local _end = Fill_between_with_char(start_end_length, ">", fold_line_count .. "<", ">", 0)
	return _start .. banner .. _end
end

vim.opt.foldtext = "v:lua.MyFoldText()"
vim.opt.fillchars:append({ fold = " " })

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

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*.*" },
	callback = function()
		vim.wo.relativenumber = true
	end,
})

vim.api.nvim_create_autocmd({ "BufLeave" }, {
	pattern = { "*.*" },
	callback = function()
		vim.wo.relativenumber = false
	end,
})

vim.cmd([[
  autocmd FileType * setlocal formatoptions=jcrql
]])

vim.opt.shortmess:append("c") -- shortens file messages for specifc things, check help for more info

vim.cmd("set whichwrap+=<,>,[,],h,l") -- allows specific keys to move to the next line if cursor is on BOL or EOL

vim.cmd("set iskeyword+=-") -- handle foo-bar as one word

vim.cmd("autocmd InsertEnter * set nocul")
vim.cmd("autocmd InsertLeave * set cul")
vim.cmd("autocmd InsertEnter * set cursorcolumn")
vim.cmd("autocmd InsertLeave * set nocursorcolumn")
