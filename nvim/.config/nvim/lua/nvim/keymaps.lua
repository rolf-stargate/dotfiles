-- Setup
local term_opts = { silent = true }

local keymap = vim.keymap.set

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

vim.keymap.set("n", "<Leader>+", "<C-+>", {
	noremap = true,
	silent = true,
	desc = "Zoom in",
})

-- Esc
vim.keymap.set("n", "<Leader>j", "<Esc>", {
	noremap = true,
	silent = true,
	desc = "Esc",
})
vim.keymap.set("i", "<Leader>j", "<Esc>", {
	noremap = true,
	silent = true,
	desc = "Esc",
})
vim.keymap.set("v", "<Leader>j", "<Esc>", {
	noremap = true,
	silent = true,
	desc = "Esc",
})

vim.keymap.set("n", "<Leader>J", "<Esc>", {
	noremap = true,
	silent = true,
	desc = "Esc",
})
vim.keymap.set("i", "<Leader>J", "<Esc>", {
	noremap = true,
	silent = true,
	desc = "Esc",
})
vim.keymap.set("v", "<Leader>J", "<Esc>", {
	noremap = true,
	silent = true,
	desc = "Esc",
})

-- Keep Indent Hack when pressing ESC
vim.keymap.set("n", "o", "ox<bs>", {
	noremap = true,
	silent = true,
	desc = "New Line Below",
})

vim.keymap.set("n", "O", "Ox<bs>", {
	noremap = true,
	silent = true,
	desc = "New Line Above",
})

-- Save & Quit
vim.keymap.set("n", "Q", ":wq<CR>", {
	noremap = true,
	silent = true,
	desc = "Save & Quit",
})

-- Change Current Filename
vim.keymap.set("n", "<Leader>cf", ":!mv % %:h/%P", {
	noremap = true,
	silent = true,
	desc = "Edit Current Filename",
})

vim.keymap.set("n", "<Leader>cF", ":!mv % %:h/", {
	noremap = true,
	silent = true,
	desc = "Change Current Filename",
})

-- Last Buffer
vim.keymap.set("n", "<Leader>b", "<C-^>", {
	noremap = true,
	silent = true,
	desc = "Last Buffer",
})

-- Capitalise Last Word

vim.keymap.set("n", "<leader>u", "<esc>bgUaw", {
	noremap = true,
	silent = true,
	desc = "Capitalise Last Word",
})

vim.keymap.set("i", "<leader>u", "<esc>bgUawea", {
	noremap = true,
	silent = true,
	desc = "Capitalise Last Word",
})

-- Crtl Backspace
vim.keymap.set("i", "<C-bs>", "<C-w>", {
	noremap = true,
	silent = true,
	desc = "Crtl Backspace",
})

-- switch ; and , for f command
vim.keymap.set("n", "<S-l>", ";", {
	noremap = true,
	silent = true,
	desc = ";",
})
vim.keymap.set("n", "<S-h>", ",", {
	noremap = true,
	silent = true,
	desc = ",",
})

-- Keep visual selection for indentation
vim.keymap.set("v", "<", "<gv", {
	noremap = true,
	silent = true,
	desc = "Keep Visual Selection for Indentation",
})
vim.keymap.set("v", ">", ">gv", {
	noremap = true,
	silent = true,
	desc = "Keep Visual Selection for Indentation",
})

-- Copy to EOL
vim.keymap.set("n", "Y", "y$", {
	noremap = true,
	silent = true,
	desc = "Copy to EOL",
})

-- Toggle Fold
vim.keymap.set("n", "<Space><Space>", "@=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>", {
	noremap = true,
	silent = true,
	desc = "Toggle Fold",
})

-- Scroll Half Page
vim.keymap.set("n", "<C-UP>", "<C-U>", {
	noremap = true,
	silent = true,
	desc = "Scroll Half Page UP",
})
vim.keymap.set("n", "<C-DOWN>", "<C-D>", {
	noremap = true,
	silent = true,
	desc = "Scroll Half Page DOWN",
})

-- Undo break points
vim.keymap.set("i", ",", ",<c-g>u", { noremap = true, silent = true })
vim.keymap.set("i", ".", ".<c-g>u", { noremap = true, silent = true })
vim.keymap.set("i", "?", "?<c-g>u", { noremap = true, silent = true })
vim.keymap.set("i", "!", "!<c-g>u", { noremap = true, silent = true })
-- vim.keymap.set("i", "<", "<<c-g>u", { noremap = true, silent = true })
vim.keymap.set("i", ">", "><c-g>u", { noremap = true, silent = true })
vim.keymap.set("i", ":", ":<c-g>u", { noremap = true, silent = true })

-- Move line or line selection
vim.keymap.set("n", "<A-k>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-j>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("i", "<A-k>", "<ESC>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.keymap.set("i", "<A-j>", "<ESC>:m .-2<CR>==gi", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- do not populate delete register when pasting over visual selection
vim.keymap.set("v", "p", '"_dp', { noremap = true, silent = true })

-- Adding ; to the end of line
vim.keymap.set("n", "<Leader>d", "<Esc>A;<Esc>", {
	noremap = true,
	silent = true,
	desc = "Add ; to EOL",
})
vim.keymap.set("i", "<Leader>d", "<Esc>A;<Esc>", {
	noremap = true,
	silent = true,
	desc = "Add ; to EOL",
})

-- Create code block with ()
vim.keymap.set("n", "<Leader>(", "<Esc>A<Space>(<CR>)<Esc>ko", {
	noremap = true,
	silent = true,
	desc = "Create Code Block ()",
})
vim.keymap.set("i", "<Leader>(", "<Esc>A<Space>(<CR>)<Esc>ko", {
	noremap = true,
	silent = true,
	desc = "Create Code Block ()",
})
vim.keymap.set("n", "<Leader>)", "<Esc>A<Space>(<CR>)<Esc>ko", {
	noremap = true,
	silent = true,
	desc = "Create Code Block ()",
})
vim.keymap.set("i", "<Leader>)", "<Esc>A<Space>(<CR>)<Esc>ko", {
	noremap = true,
	silent = true,
	desc = "Create Code Block ()",
})

-- Create code block with {}
vim.keymap.set("n", "<Leader>{", "<Esc>A<Space>{<CR>}<Esc>ko", {
	noremap = true,
	silent = true,
	desc = "Create Code Block {}",
})
vim.keymap.set("i", "<Leader>{", "<Esc>A<Space>{<CR>}<Esc>ko", {
	noremap = true,
	silent = true,
	desc = "Create Code Block {}",
})
vim.keymap.set("n", "<Leader>}", "<Esc>A<Space>{<CR>}<Esc>ko", {
	noremap = true,
	silent = true,
	desc = "Create Code Block {}",
})
vim.keymap.set("i", "<Leader>}", "<Esc>A<Space>{<CR>}<Esc>ko", {
	noremap = true,
	silent = true,
	desc = "Create Code Block {}",
})

-- Create code block with []
vim.keymap.set("n", "<Leader>[", "<Esc>A<Space>[<CR>]<Esc>ko", {
	noremap = true,
	silent = true,
	desc = "Create Code Block []",
})
vim.keymap.set("i", "<Leader>[", "<Esc>A<Space>[<CR>]<Esc>ko", {
	noremap = true,
	silent = true,
	desc = "Create Code Block []",
})
vim.keymap.set("n", "<Leader>]", "<Esc>A<Space>[<CR>]<Esc>ko", {
	noremap = true,
	silent = true,
	desc = "Create Code Block []",
})
vim.keymap.set("i", "<Leader>]", "<Esc>A<Space>[<CR>]<Esc>ko", {
	noremap = true,
	silent = true,
	desc = "Create Code Block []",
})

-- Paste from system clipboard
vim.keymap.set("n", "<Leader>p", '"*p', {
	noremap = true,
	silent = true,
	desc = "Paste From System Clipboard",
})

-- Quickfix
vim.keymap.set("n", "Q", ":lua ToggleQFList()<CR>", {
	noremap = true,
	silent = true,
	desc = "Toggle Quickfix List",
})
vim.keymap.set("n", "<C-n>", ":cnext<CR>", {
	noremap = true,
	silent = true,
	desc = "Next Quickfix Item",
})
vim.keymap.set("n", "<C-p>", ":cprevious<CR>", {
	noremap = true,
	silent = true,
	desc = "Previous Quickfix Item",
})

vim.cmd("autocmd! FileType qf nnoremap <buffer> <leader><Enter> <C-w><Enter>")

-- Print Page
vim.keymap.set("n", "<leader>PPP", ":lua PrintPage()<cr>", {
	noremap = true,
	silent = true,
	desc = "Print Page",
})

-- Save
vim.keymap.set("n", "<leader>ss", ":w<Cr>", {
	noremap = true,
	silent = true,
	desc = "Save File",
})

-- Next Spelling Mistake
vim.keymap.set("n", "<leader>ns", "]sz=", {
	noremap = true,
	silent = true,
	desc = "Next Spelling Mistake",
})

-- Previous Spelling Mistake
vim.keymap.set("n", "<leader>nS", "[sz=", {
	noremap = true,
	silent = true,
	desc = "Previous Spelling Mistake",
})

-- Source Config
vim.keymap.set("n", "<leader>sc", ":source ~/.config/nvim/init.lua<Cr>", {
	noremap = true,
	silent = true,
	desc = "Source Config",
})

-- Set Terminal Title
vim.keymap.set("n", "<leader>st", "<cmd>lua SetTerminalTitle()<cr>", {
	noremap = true,
	silent = true,
	desc = "Set Terminal Title",
})

-- Comments

-- Duplicate a line and comment out the first line
vim.keymap.set("n", "yc", "yygccp")

-- Change Text
vim.keymap.set("n", "<leader>cj", "<cmd>normal gcc<cr>", {
	noremap = true,
	silent = true,
	desc = "Toggle Comment",
})
vim.keymap.set("v", "<leader>cj", "<cmd>normal gcc<cr>", {
	noremap = true,
	silent = true,
	desc = "Toggle Comment",
})
vim.keymap.set("i", "<leader>cj", "<cmd>normal gcc<cr>", {
	noremap = true,
	silent = true,
	desc = "Toggle Comment",
})

function comment_block_with_input()
	local comment_string = vim.bo.commentstring:match("^(.-)%s?%%s")

	local line_start, col_start = vim.fn.getpos("'<")[2], vim.fn.getpos("'<")[3]
	local line_end, col_end = vim.fn.getpos("'>")[2], vim.fn.getpos("'>")[3]

	local user_text = vim.fn.input("Enter Comment Text: "):upper()

	local top_comment_start = string.format("%s |////|__ %s __|", comment_string, user_text)
	local top_comment_end = "|»)-->"
	top_comment = top_comment_start .. string.rep("/", 81 - #top_comment_start - #top_comment_end) .. top_comment_end

	local line = comment_string .. " " .. string.rep(":", 78)
	local bottom_comment_start = string.format("%s <--(«|", comment_string)
	local bottom_comment_end = string.format("|__ %s __|////|", user_text)
	local bottom_comment = bottom_comment_start
		.. string.rep("/", 81 - #bottom_comment_start - #bottom_comment_end)
		.. bottom_comment_end

	vim.fn.append(line_end, bottom_comment)
	vim.fn.append(line_end, line)
	vim.fn.append(line_start - 1, line)
	vim.fn.append(line_start - 1, top_comment)
end
vim.api.nvim_set_keymap("v", "<leader>cB", ":lua comment_block_with_input()<CR>", { noremap = true, silent = true })

function small_comment_block_with_input()
	local comment_string = vim.bo.commentstring:match("^(.-)%s?%%s")

	local line_start, col_start = vim.fn.getpos("'<")[2], vim.fn.getpos("'<")[3]
	local line_end, col_end = vim.fn.getpos("'>")[2], vim.fn.getpos("'>")[3]

	local user_text = vim.fn.input("Enter Comment Text: "):upper()

	local top_comment_start = string.format("%s <=====", comment_string)
	local top_comment_end = string.format("  %s  =======", user_text)
	local top_comment = top_comment_start
		.. string.rep("=", 80 - #top_comment_start - #top_comment_end)
		.. top_comment_end

	local bottom_comment_start = string.format("%s <=====", comment_string)
	local bottom_comment_end = string.format(">  %s  <======", user_text)
	local bottom_comment = bottom_comment_start
		.. string.rep("=", 80 - #bottom_comment_start - #bottom_comment_end)
		.. bottom_comment_end

	vim.fn.append(line_end, bottom_comment)
	vim.fn.append(line_start - 1, top_comment)
end

vim.api.nvim_set_keymap(
	"v",
	"<leader>cb",
	":lua small_comment_block_with_input()<CR>",
	{ noremap = true, silent = true }
)

function tiny_comment_block_with_input()
	local comment_string = vim.bo.commentstring:match("^(.-)%s?%%s")

	local line_start, col_start = vim.fn.getpos("'<")[2], vim.fn.getpos("'<")[3]
	local line_end, col_end = vim.fn.getpos("'>")[2], vim.fn.getpos("'>")[3]

	local user_text = vim.fn.input("Enter Comment Text: "):upper()

	local top_comment_start = string.format("%s <-----", comment_string)
	local top_comment_end = string.format("  %s  -----", user_text)
	local top_comment = top_comment_start
		.. string.rep("-", 80 - #top_comment_start - #top_comment_end)
		.. top_comment_end

	local bottom_comment_start = string.format("%s <-----", comment_string)
	local bottom_comment_end = string.format(">  %s  <----", user_text)
	local bottom_comment = bottom_comment_start
		.. string.rep("-", 80 - #bottom_comment_start - #bottom_comment_end)
		.. bottom_comment_end

	vim.fn.append(line_end, bottom_comment)
	vim.fn.append(line_start - 1, top_comment)
end

vim.api.nvim_set_keymap(
	"v",
	"<leader>cv",
	":lua tiny_comment_block_with_input()<CR>",
	{ noremap = true, silent = true }
)

-- Insert Text

vim.keymap.set("n", "<leader>ic", "o<esc>k:normal gbj<cr>o", {
	noremap = true,
	silent = true,
	desc = "Start Multiline Comment",
})

vim.keymap.set("n", "<leader>it", ":normal gcc<cr>ATODO: ", {
	noremap = true,
	silent = true,
	desc = "Insert Todo Comment",
})

vim.keymap.set("n", "<leader>in", ":normal gcc<cr>ANOTE: ", {
	noremap = true,
	silent = true,
	desc = "Insert Note Comment",
})

vim.keymap.set("i", "<leader>ic", "<esc>o<esc>k:normal gbj<cr>o", {
	noremap = true,
	silent = true,
	desc = "Start Multiline Comment",
})

vim.keymap.set("i", "<leader>it", "<esc>:normal gcc<cr>ATODO: ", {
	noremap = true,
	silent = true,
	desc = "Insert Todo Comment",
})

vim.keymap.set("i", "<leader>in", "<esc>:normal gcc<cr>ANOTE: ", {
	noremap = true,
	silent = true,
	desc = "Insert Note Comment",
})

-- Change Working Directory To Current Dir
vim.keymap.set("n", "<leader>cd", ":lcd %:p:h<CR>", {
	noremap = true,
	silent = true,
	desc = "Change Working Directory To Current Dir",
})

-- Search and Replace
vim.keymap.set("n", "<leader>rr", ":%s///gI<Left><Left><Left><Left>", {
	noremap = true,
	silent = true,
	desc = "Search/Replace in File",
})
vim.keymap.set("n", "<leader>rw", ":%s/<C-r><C-w>//gI<Left><Left><Left>", {
	noremap = true,
	silent = true,
	desc = "Search/Replace Word in File",
})
--
vim.keymap.set("v", "<leader>rr", ":s///gI<Left><Left><Left><Left>", {
	noremap = true,
	silent = true,
	desc = "Search/Replace in Selection",
})
vim.keymap.set("v", "<leader>rw", ":s/<C-r><C-w>//gI<Left><Left><Left>", {
	noremap = true,
	silent = true,
	desc = "Search/Replace Word in Selection",
})

-- Toggle
vim.keymap.set("n", "<leader>ts", "<cmd>setlocal spell!<CR>", {
	noremap = true,
	silent = true,
	desc = "Toggle Spellcheck",
})
vim.keymap.set("n", "<leader>th", "<cmd>set hls!<CR>", {
	noremap = true,
	silent = true,
	desc = "Toggle Search Highligthing",
})

-- Copy Filename/Path
vim.keymap.set("n", "<leader>yf", ":let @+ = expand('%:t')<cr>:echo 'Filename copied'<cr>", {
	noremap = true,
	silent = true,
	desc = "Copy Filename",
})
vim.keymap.set("n", "<leader>yp", ":let @+ = expand('%:p')<cr>:echo 'Path copied'<cr>", {
	noremap = true,
	silent = true,
	desc = "Copy Path",
})

-- ### Terminal ###################################################################
vim.cmd("let g:floaterm_wintype = 'split'")

vim.keymap.set("t", "<c-\\><c-N>", "<esc>", {
	noremap = true,
	silent = true,
	desc = "Esc",
})

vim.keymap.set("t", "<leader>tt", "<cmd>FloatermToggle<CR>", {
	noremap = true,
	silent = true,
	desc = "Toggle Floaterm",
})

vim.keymap.set("n", "<leader>tt", "<cmd>FloatermToggle<CR>", {
	noremap = true,
	silent = true,
	desc = "Toggle Floaterm",
})

vim.keymap.set(
	"n",
	"<leader>tl",
	":FloatermNew --autoclose=2 --width=" .. Get_window_width() .. " --height=" .. Get_window_height() .. " lazygit<CR>",
	{
		noremap = true,
		silent = true,
		desc = "Lazygit",
	}
)

-- Format
vim.keymap.set("n", "<leader>F", "<cmd>Format<CR>", {
	noremap = true,
	silent = true,
	desc = "Format File",
})
vim.keymap.set("i", "<leader>F", "<cmd>Format<CR>", {
	noremap = true,
	silent = true,
	desc = "Format File",
})
