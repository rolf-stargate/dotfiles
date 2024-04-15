-- Setup
local opts = { noremap = true, silent = true }
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
keymap("n", "<Leader>j", "<Esc>", opts)
keymap("i", "<Leader>j", "<Esc>", opts)
keymap("v", "<Leader>j", "<Esc>", opts)

keymap("n", "<Leader>J", "<Esc>", opts)
keymap("i", "<Leader>J", "<Esc>", opts)
keymap("v", "<Leader>J", "<Esc>", opts)

keymap("n", "Q", ":wq<CR>", opts) -- Quit

keymap("n", "<Leader>b", "<C-^>", opts) -- Switch To Last Buffer

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<C-bs>", "<C-w>", opts) -- Crtl Backspaced

-- switch ; and , for f command
keymap("n", "<S-l>", ";", opts)
keymap("n", "<S-h>", ",", opts)

-- Keep visual selection for indentation
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("n", "Y", "y$", opts) -- Copy to EOL

keymap("n", "<Space><Space>", "@=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>", opts) -- fold

-- Behavior
keymap("n", "<C-UP>", "<C-U>", opts)
keymap("n", "<C-DOWN>", "<C-D>", opts)

-- Undo break points
keymap("i", ",", ",<c-g>u", opts)
keymap("i", ".", ".<c-g>u", opts)
keymap("i", "?", "?<c-g>u", opts)
keymap("i", "!", "!<c-g>u", opts)
keymap("i", "<", "<<c-g>u", opts)
keymap("i", ">", "><c-g>u", opts)
keymap("i", ":", ":<c-g>u", opts)

-- Move line or line selection
keymap("n", "<A-k>", ":m .+1<CR>==", opts)
keymap("n", "<A-j>", ":m .-2<CR>==", opts)
keymap("i", "<A-k>", "<ESC>:m .+1<CR>==gi", opts)
keymap("i", "<A-j>", "<ESC>:m .-2<CR>==gi", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)

-- do not populate delete register when pasting over visual selection
keymap("v", "p", '"_dp', opts)

-- Create
-- Adding ; to the end of line
keymap("n", "<Leader>d", "<Esc>A;", opts)
keymap("i", "<Leader>d", "<Esc>A;<Esc>", opts)

-- Create code block with {}
keymap("n", "<Leader>{", "<Esc>A<Space>{<CR>}<Esc>ko", opts)
keymap("i", "<Leader>{", "<Esc>A<Space>{<CR>}<Esc>ko", opts)
keymap("n", "<Leader>}", "<Esc>A<Space>{<CR>}<Esc>ko", opts)
keymap("i", "<Leader>}", "<Esc>A<Space>{<CR>}<Esc>ko", opts)

-- Create code block with []
keymap("n", "<Leader>[", "<Esc>A<Space>[<CR>]<Esc>ko", opts)
keymap("i", "<Leader>[", "<Esc>A<Space>[<CR>]<Esc>ko", opts)
keymap("n", "<Leader>]", "<Esc>A<Space>[<CR>]<Esc>ko", opts)
keymap("i", "<Leader>]", "<Esc>A<Space>[<CR>]<Esc>ko", opts)

-- Extras
keymap("n", "<Leader>p", '"*p', opts)

-- Quickfix
keymap("n", "<Leader>q", ":lua ToggleQFList()<CR>", opts)
keymap("n", "<A-l>", ":cnext<CR>", opts)
keymap("n", "<A-h>", ":cprevious<CR>", opts)

-- Print Page
keymap("n", "<leader>P", ":lua PrintPage()<cr>", opts)

-- s
keymap("n", "<leader>ss", ":w<Cr>", opts) -- Save
keymap("n", "<leader>sn", "]sz=", opts) -- Next Spelling Mistake
keymap("n", "<leader>sp", "[sz=", opts) -- Previous Spelling Mistake
keymap("n", "<leader>sc", ":source ~/.config/nvim/init.lua<Cr>", opts) -- Source Config
keymap("n", "<leader>st", "<cmd>lua SetTerminalTitle()<cr>", opts) -- Set Terminal Title

-- c
keymap("n", "<leader>cj", "<cmd>normal gcc<cr>", opts) -- Toggle Comment
keymap("v", "<leader>cj", "<cmd>normal gcc<cr>", opts) -- Toggle Comment V-Mode
keymap("i", "<leader>cj", "<cmd>normal gcc<cr>", opts) -- Toggle Comment I-Mode

keymap("n", "<leader>ch", "I###<space><esc>A<space><esc>80A#<esc>080lD:normal gcc<cr>", opts) -- Heading Comment
keymap("i", "<leader>ch", "<esc>I###<space><esc>A<space><esc>80A#<esc>080lD:normal gcc<cr>", opts) -- Heading Comment I-Mode

keymap("n", "<leader>cd", ":lcd %:p:h<CR>", opts) -- Change Working Directory To Current Dir

--r
-- Search and Replace
-- I-Mode
keymap("n", "<leader>rr", ":%s///gI<Left><Left><Left><Left>", opts) -- Search/Replace in File
keymap("n", "<leader>rw", ":%s/<C-r><C-w>//gI<Left><Left><Left>", opts) -- Search/Replace Word in File
keymap("n", "<leader>rp", ":lua Search_and_replace_project()<cr>", opts) -- Search/Replace Project
-- V-Mode
keymap("v", "<leader>rr", ":s///gI<Left><Left><Left><Left>", opts) -- Search/Replace in File
keymap("v", "<leader>rw", ":s/<C-r><C-w>//gI<Left><Left><Left>", opts) -- Search/Replace Word in File

--t
-- Toggle
keymap("n", "<leader>ts", "<cmd>setlocal spell!<CR>", opts) -- Toggle Spell Checking
keymap("n", "<leader>th", "<cmd>set hls!<CR>", opts) -- Toggle Search Highligthing

--y
-- Copy Filename/Path
keymap("n", "<leader>yf", ":let @+ = expand('%:t')<cr>:echo 'Filename copied'<cr>", opts)
keymap("n", "<leader>yF", ":let @+ = expand('%:p')<cr>:echo 'Path copied'<cr>", opts)
