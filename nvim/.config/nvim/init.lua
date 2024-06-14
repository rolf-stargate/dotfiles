-- easy-i3-neovim-nav
vim.fn.serverstart(vim.fn.tempname())
vim.opt.titlestring = "nvim %F -- [" .. vim.v.servername .. "]"
vim.opt.title = true

-- nvim
require("nvim.utility_functions")
require("nvim.options")
require("nvim.keymaps")

-- filetypes
require("filetypes.lazygit")
require("filetypes.text")
require("filetypes.c")
require("filetypes.vimwiki")
require("filetypes.r")
require("filetypes.ledger")

-- plugins
require("plugins.init")

-- colorscheme
require("nvim.colorscheme")
