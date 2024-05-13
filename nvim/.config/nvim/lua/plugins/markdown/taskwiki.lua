vim.g.taskwiki_disable_concealcursor = "no"

  vim.cmd("normal! TaskWikiMod<cr>due:tomorrow")

-- Today Report
vim.keymap.set("n", "<leader>TT", ":FloatermNew --autoclose=1 --wintype=split taskwarrior-tui -r today<cr>", {
	noremap = true,
	silent = true,
	desc = "Due Today",
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


