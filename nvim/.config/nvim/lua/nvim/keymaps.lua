-- Setup
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

-- Helper Functions
function ToggleQFList() -- Quickfix
	local qf_exists = false
	for _, win in pairs(vim.fn.getwininfo()) do
		if win["quickfix"] == 1 then
			qf_exists = true
		end
	end
	if qf_exists == true then
		vim.cmd("cclose")
		return
	end
	if not vim.tbl_isempty(vim.fn.getqflist()) then
		vim.cmd("copen")
	end
end

function PrintPage() -- Print Page
	local cmd =
		"iconv -f utf-8 -t latin1 % | enscript --header='$(date +\"\\%d.\\%m.\\%Y\")' -f=12 --margin=72:72:72:72 -1 --word-wrap --media=A4 --footer='||Page $\\% of $='"
	vim.cmd("! " .. cmd)
end

function Search_and_replace_project() -- Search And Replace in Project
	-- Get the search string either from visual selection or user input
	local search_str
	search_str = vim.fn.input("Enter the search string: ")

	-- Get the replace string from user input
	local replace_str = vim.fn.input("Enter the replace string: ")

	-- Run vimgrep to populate the quickfix list
	vim.cmd("vimgrep /" .. search_str .. "/g **/*")

	-- Open the quickfix window
	vim.cmd("copen")

	-- Perform the search and replace on each file in the quickfix list
	-- 'gc' flag asks for confirmation for each replacement
	vim.cmd("cfdo %s/" .. search_str .. "/" .. replace_str .. "/gc | update")
end

function SetTerminalTitle() -- Set Terminal Title
	vim.ui.input({
		prompt = "Title:",
	}, function(title)
		if title ~= "" then
			vim.api.nvim_command("set titlestring=" .. title)
		end
	end)
end

-- Base
vim.g.mapleader = ";"
vim.g.maplocalleader = " "

-- Esc
vim.api.nvim_set_keymap("n", "<Leader>j", "<Esc>", {
	noremap = true,
	silent = true,
	desc = "Esc",
})
vim.api.nvim_set_keymap("i", "<Leader>j", "<Esc>", {
	noremap = true,
	silent = true,
	desc = "Esc",
})
vim.api.nvim_set_keymap("v", "<Leader>j", "<Esc>", {
	noremap = true,
	silent = true,
	desc = "Esc",
})

vim.api.nvim_set_keymap("n", "<Leader>J", "<Esc>", {
	noremap = true,
	silent = true,
	desc = "Esc",
})
vim.api.nvim_set_keymap("i", "<Leader>J", "<Esc>", {
	noremap = true,
	silent = true,
	desc = "Esc",
})
vim.api.nvim_set_keymap("v", "<Leader>J", "<Esc>", {
	noremap = true,
	silent = true,
	desc = "Esc",
})

-- Save & Quit
vim.api.nvim_set_keymap("n", "Q", ":wq<CR>", {
	noremap = true,
	silent = true,
	desc = "Save & Quit",
})

-- Last Buffer
vim.api.nvim_set_keymap("n", "<Leader>b", "<C-^>", {
	noremap = true,
	silent = true,
	desc = "Last Buffer",
})

-- Better window navigation
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {
	noremap = true,
	silent = true,
	desc = "Window/Split Left",
})
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {
	noremap = true,
	silent = true,
	desc = "Window/Split Down",
})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {
	noremap = true,
	silent = true,
	desc = "Window/Split UP",
})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {
	noremap = true,
	silent = true,
	desc = "Window/Split Right",
})

-- Crtl Backspace
vim.api.nvim_set_keymap("i", "<C-bs>", "<C-w>", {
	noremap = true,
	silent = true,
	desc = "Crtl Backspace",
})

-- switch ; and , for f command
vim.api.nvim_set_keymap("n", "<S-l>", ";", {
	noremap = true,
	silent = true,
	desc = ";",
})
vim.api.nvim_set_keymap("n", "<S-h>", ",", {
	noremap = true,
	silent = true,
	desc = ",",
})

-- Keep visual selection for indentation
vim.api.nvim_set_keymap("v", "<", "<gv", {
	noremap = true,
	silent = true,
	desc = "Keep Visual Selection for Indentation",
})
vim.api.nvim_set_keymap("v", ">", ">gv", {
	noremap = true,
	silent = true,
	desc = "Keep Visual Selection for Indentation",
})

-- Copy to EOL
vim.api.nvim_set_keymap("n", "Y", "y$", {
	noremap = true,
	silent = true,
	desc = "Copy to EOL",
})

-- Toggle Fold
vim.api.nvim_set_keymap("n", "<Space><Space>", "@=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>", {
	noremap = true,
	silent = true,
	desc = "Toggle Fold",
})

-- Scroll Half Page
vim.api.nvim_set_keymap("n", "<C-UP>", "<C-U>", {
	noremap = true,
	silent = true,
	desc = "Scroll Half Page UP",
})
vim.api.nvim_set_keymap("n", "<C-DOWN>", "<C-D>", {
	noremap = true,
	silent = true,
	desc = "Scroll Half Page DOWN",
})

-- Undo break points
vim.api.nvim_set_keymap("i", ",", ",<c-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", ".", ".<c-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "?", "?<c-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "!", "!<c-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<", "<<c-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", ">", "><c-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", ":", ":<c-g>u", { noremap = true, silent = true })

-- Move line or line selection
vim.api.nvim_set_keymap("n", "<A-k>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-j>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-k>", "<ESC>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-j>", "<ESC>:m .-2<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- do not populate delete register when pasting over visual selection
vim.api.nvim_set_keymap("v", "p", '"_dp', { noremap = true, silent = true })

-- Adding ; to the end of line
vim.api.nvim_set_keymap("n", "<Leader>d", "<Esc>A;", {
	noremap = true,
	silent = true,
	desc = "Add ; to EOL",
})
vim.api.nvim_set_keymap("i", "<Leader>d", "<Esc>A;<Esc>", {
	noremap = true,
	silent = true,
	desc = "Add ; to EOL",
})

-- Create code block with {}
vim.api.nvim_set_keymap("n", "<Leader>{", "<Esc>A<Space>{<CR>}<Esc>ko", {
	noremap = true,
	silent = true,
	desc = "Create Code Block {}",
})
vim.api.nvim_set_keymap("i", "<Leader>{", "<Esc>A<Space>{<CR>}<Esc>ko", {
	noremap = true,
	silent = true,
	desc = "Create Code Block {}",
})
vim.api.nvim_set_keymap("n", "<Leader>}", "<Esc>A<Space>{<CR>}<Esc>ko", {
	noremap = true,
	silent = true,
	desc = "Create Code Block {}",
})
vim.api.nvim_set_keymap("i", "<Leader>}", "<Esc>A<Space>{<CR>}<Esc>ko", {
	noremap = true,
	silent = true,
	desc = "Create Code Block {}",
})

-- Create code block with []
vim.api.nvim_set_keymap("n", "<Leader>[", "<Esc>A<Space>[<CR>]<Esc>ko", {
	noremap = true,
	silent = true,
	desc = "Create Code Block []",
})
vim.api.nvim_set_keymap("i", "<Leader>[", "<Esc>A<Space>[<CR>]<Esc>ko", {
	noremap = true,
	silent = true,
	desc = "Create Code Block []",
})
vim.api.nvim_set_keymap("n", "<Leader>]", "<Esc>A<Space>[<CR>]<Esc>ko", {
	noremap = true,
	silent = true,
	desc = "Create Code Block []",
})
vim.api.nvim_set_keymap("i", "<Leader>]", "<Esc>A<Space>[<CR>]<Esc>ko", {
	noremap = true,
	silent = true,
	desc = "Create Code Block []",
})

-- Paste from system clipboard
vim.api.nvim_set_keymap("n", "<Leader>p", '"*p', {
	noremap = true,
	silent = true,
	desc = "Paste From System Clipboard",
})

-- Quickfix
vim.api.nvim_set_keymap("n", "<Leader>q", ":lua ToggleQFList()<CR>", {
	noremap = true,
	silent = true,
	desc = "Toggle Quickfix List",
})
vim.api.nvim_set_keymap("n", "<A-l>", ":cnext<CR>", {
	noremap = true,
	silent = true,
	desc = "Next Quickfix Item",
})
vim.api.nvim_set_keymap("n", "<A-h>", ":cprevious<CR>", {
	noremap = true,
	silent = true,
	desc = "Previous Quickfix Item",
})

-- Print Page
vim.api.nvim_set_keymap("n", "<leader>P", ":lua PrintPage()<cr>", {
	noremap = true,
	silent = true,
	desc = "Print Page",
})

-- Save
vim.api.nvim_set_keymap("n", "<leader>ss", ":w<Cr>", {
	noremap = true,
	silent = true,
	desc = "Save File",
})

-- Next Spelling Mistake
vim.api.nvim_set_keymap("n", "<leader>ns", "]sz=", {
	noremap = true,
	silent = true,
	desc = "Next Spelling Mistake",
})

-- Previous Spelling Mistake
vim.api.nvim_set_keymap("n", "<leader>nS", "[sz=", {
	noremap = true,
	silent = true,
	desc = "Previous Spelling Mistake",
})

-- Source Config
vim.api.nvim_set_keymap("n", "<leader>sc", ":source ~/.config/nvim/init.lua<Cr>", {
	noremap = true,
	silent = true,
	desc = "Source Config",
})

-- Set Terminal Title
vim.api.nvim_set_keymap("n", "<leader>st", "<cmd>lua SetTerminalTitle()<cr>", {
	noremap = true,
	silent = true,
	desc = "Set Terminal Title",
})

-- Comments
vim.api.nvim_set_keymap("n", "<leader>cj", "<cmd>normal gcc<cr>", {
	noremap = true,
	silent = true,
	desc = "Toggle Comment",
})
vim.api.nvim_set_keymap("v", "<leader>cj", "<cmd>normal gcc<cr>", {
	noremap = true,
	silent = true,
	desc = "Toggle Comment",
})
vim.api.nvim_set_keymap("i", "<leader>cj", "<cmd>normal gcc<cr>", {
	noremap = true,
	silent = true,
	desc = "Toggle Comment",
})

vim.api.nvim_set_keymap("n", "<leader>ch", "I###<space><esc>A<space><esc>80A#<esc>080lD:normal gcc<cr>", {
	noremap = true,
	silent = true,
	desc = "Headline Comment",
})
vim.api.nvim_set_keymap("i", "<leader>ch", "<esc>I###<space><esc>A<space><esc>80A#<esc>080lD:normal gcc<cr>", {
	noremap = true,
	silent = true,
	desc = "Headline Comment",
})

-- Change Working Directory To Current Dir
vim.api.nvim_set_keymap("n", "<leader>cd", ":lcd %:p:h<CR>", {
	noremap = true,
	silent = true,
	desc = "Change Working Directory To Current Dir",
})

-- Search and Replace
vim.api.nvim_set_keymap("n", "<leader>rr", ":%s///gI<Left><Left><Left><Left>", {
	noremap = true,
	silent = true,
	desc = "Search/Replace in File",
})
vim.api.nvim_set_keymap("n", "<leader>rw", ":%s/<C-r><C-w>//gI<Left><Left><Left>", {
	noremap = true,
	silent = true,
	desc = "Search/Replace Word in File",
})
vim.api.nvim_set_keymap("n", "<leader>rp", ":lua Search_and_replace_project()<cr>", {
	noremap = true,
	silent = true,
	desc = "Search/Replace Project",
})
vim.api.nvim_set_keymap("v", "<leader>rr", ":s///gI<Left><Left><Left><Left>", {
	noremap = true,
	silent = true,
	desc = "Search/Replace in Selection",
})
vim.api.nvim_set_keymap("v", "<leader>rw", ":s/<C-r><C-w>//gI<Left><Left><Left>", {
	noremap = true,
	silent = true,
	desc = "Search/Replace Word in Selection",
})

-- Toggle
vim.api.nvim_set_keymap("n", "<leader>ts", "<cmd>setlocal spell!<CR>", {
	noremap = true,
	silent = true,
	desc = "Toggle Spellcheck",
})
vim.api.nvim_set_keymap("n", "<leader>th", "<cmd>set hls!<CR>", {
	noremap = true,
	silent = true,
	desc = "Toggle Search Highligthing",
})

-- Copy Filename/Path
vim.api.nvim_set_keymap("n", "<leader>yf", ":let @+ = expand('%:t')<cr>:echo 'Filename copied'<cr>", {
	noremap = true,
	silent = true,
	desc = "Copy Filename",
})
vim.api.nvim_set_keymap("n", "<leader>yp", ":let @+ = expand('%:p')<cr>:echo 'Path copied'<cr>", {
	noremap = true,
	silent = true,
	desc = "Copy Path",
})
