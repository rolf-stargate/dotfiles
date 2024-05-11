vim.g.taskwiki_disable_concealcursor = "no"

  vim.cmd("normal! TaskWikiMod<cr>due:tomorrow")

vim.keymap.set("n", "<leader>tT", ":TaskWikiMod due:tomorrow<cr>", {
	noremap = true,
	silent = true,
	desc = "Due Tomorrow",
})


