vim.g.taskwiki_disable_concealcursor = "no"

  vim.cmd("normal! TaskWikiMod<cr>due:tomorrow")

vim.keymap.set("n", "<leader>T", ":FloatermNew --autoclose=1 --wintype=split taskwarrior-tui<cr>", {
	noremap = true,
	silent = true,
	desc = "Due Tomorrow",
})


