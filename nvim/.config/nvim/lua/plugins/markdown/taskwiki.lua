vim.g.taskwiki_suppress_mappings = "yes"
vim.g.taskwiki_disable_concealcursor = "no"
vim.g.taskwiki_dont_fold = "yes"

vim.cmd("normal! TaskWikiMod<cr>due:tomorrow")

-- Define the table with the sort orders
local taskwiki_sort_orders = {
	E = "end-",
}

-- Set the global variable
vim.g.taskwiki_sort_orders = taskwiki_sort_orders

-- Taskwiki
vim.keymap.set("n", "<leader>TT", ":lua Toggle_large_split('~/Dropbox/wiki/tasks.md', 0.8)<cr>", {
	noremap = true,
	silent = true,
	desc = "Toggle Tasks",
})

vim.keymap.set("n", "<leader>t-", ":TaskWikiStop<cr>", {
	noremap = true,
	silent = true,
	desc = "Stop Task",
})

vim.keymap.set("v", "<leader>t-", ":TaskWikiStop<cr>", {
	noremap = true,
	silent = true,
	desc = "Stop Task",
})

vim.keymap.set("n", "<leader>t+", ":TaskWikiStart<cr>", {
	noremap = true,
	silent = true,
	desc = "Start Task",
})

vim.keymap.set("v", "<leader>t+", ":TaskWikiStart<cr>", {
	noremap = true,
	silent = true,
	desc = "Start Task",
})

vim.keymap.set("n", "<leader>tm", ":TaskWikiMod<cr>", {
	noremap = true,
	silent = true,
	desc = "Modify Task",
})

vim.keymap.set("v", "<leader>tm", ":TaskWikiMod<cr>", {
	noremap = true,
	silent = true,
	desc = "Modify Task",
})

vim.keymap.set("n", "<leader>ti", ":TaskWikiInfo<cr>", {
	noremap = true,
	silent = true,
	desc = "Info Task",
})

vim.keymap.set("v", "<leader>ti", ":TaskWikiInfo<cr>", {
	noremap = true,
	silent = true,
	desc = "Info Task",
})

vim.keymap.set("n", "<leader>te", ":TaskWikiEdit<cr>", {
	noremap = true,
	silent = true,
	desc = "Edit Task",
})

vim.keymap.set("v", "<leader>te", ":TaskWikiEdit<cr>", {
	noremap = true,
	silent = true,
	desc = "Edit Task",
})

vim.keymap.set("n", "<leader>td", ":TaskWikiDone<cr>", {
	noremap = true,
	silent = true,
	desc = "Done Task",
})

vim.keymap.set("v", "<leader>td", ":TaskWikiDone<cr>", {
	noremap = true,
	silent = true,
	desc = "Done Task",
})

vim.keymap.set("n", "<leader>tD", ":TaskWikiDelete<cr>", {
	noremap = true,
	silent = true,
	desc = "Delete Task",
})

vim.keymap.set("v", "<leader>tD", ":TaskWikiDelete<cr>", {
	noremap = true,
	silent = true,
	desc = "Delete Task",
})

vim.keymap.set("n", "<leader>ta", ":TaskWikiAnnotate<cr>", {
	noremap = true,
	silent = true,
	desc = "Annotate Task",
})

vim.keymap.set("v", "<leader>ta", ":TaskWikiAnnotate<cr>", {
	noremap = true,
	silent = true,
	desc = "Annotate Task",
})

vim.keymap.set("n", "<leader>tc", ":TaskWikiCalendar<cr>", {
	noremap = true,
	silent = true,
	desc = "Annotate Task",
})

vim.keymap.set("n", "<leader>ta", ":TaskWikiAnnotate<cr>", {
	noremap = true,
	silent = true,
	desc = "Annotate Task",
})

-- Tomorrow Report
vim.keymap.set("n", "<leader>TN", ":FloatermNew --autoclose=1 --wintype=split taskwarrior-tui -r tomorrow<cr>", {
	noremap = true,
	silent = true,
	desc = "Due Tomorrow",
})

-- Week Report
vim.keymap.set("n", "<leader>TW", ":FloatermNew --autoclose=1 --wintype=split taskwarrior-tui -r week<cr>", {
	noremap = true,
	silent = true,
	desc = "Due Week",
})

-- Overdue Report
vim.keymap.set("n", "<leader>TO", ":FloatermNew --autoclose=1 --wintype=split taskwarrior-tui -r overdue<cr>", {
	noremap = true,
	silent = true,
	desc = "Due Overdue",
})

-- Urgent Report
vim.keymap.set("n", "<leader>TU", ":FloatermNew --autoclose=1 --wintype=split taskwarrior-tui<cr>", {
	noremap = true,
	silent = true,
	desc = "Urgent",
})

-- Call Report
vim.keymap.set("n", "<leader>TC", ":FloatermNew --autoclose=1 --wintype=split taskwarrior-tui -r call<cr>", {
	noremap = true,
	silent = true,
	desc = "Calls",
})

-- Mail Report
vim.keymap.set("n", "<leader>TM", ":FloatermNew --autoclose=1 --wintype=split taskwarrior-tui -r mail<cr>", {
	noremap = true,
	silent = true,
	desc = "Mails",
})

-- Appointment Report
vim.keymap.set("n", "<leader>TA", ":FloatermNew --autoclose=1 --wintype=split taskwarrior-tui -r appointment<cr>", {
	noremap = true,
	silent = true,
	desc = "Appointments",
})

-- Learning Report
vim.keymap.set("n", "<leader>TL", ":FloatermNew --autoclose=1 --wintype=split taskwarrior-tui -r learning<cr>", {
	noremap = true,
	silent = true,
	desc = "Learning",
})

-- Waiting Report
vim.keymap.set("n", "<leader>Tw", ":FloatermNew --autoclose=1 --wintype=split taskwarrior-tui -r waiting<cr>", {
	noremap = true,
	silent = true,
	desc = "Waiting",
})
