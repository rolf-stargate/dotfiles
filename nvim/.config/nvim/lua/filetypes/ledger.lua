vim.api.nvim_create_autocmd("FileType", {
	pattern = "ledger" ,
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.textwidth = 80
	end,
})

vim.api.nvim_create_autocmd("BufWrite", {
	pattern = "*.ledger",
	callback = function()
    vim.cmd("LedgerAlignBuffer")
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.ledger",
	callback = function()

  vim.keymap.set(
    "n",
    "<leader>TT",
    ":FloatermNew --autoclose=1 --height=30 watch -n 1 ledger bal -f ~/Dropbox/wiki/2023-11-28__8cfd__finance.ledger<cr>",
    {
      buffer = true,
      noremap = true,
      silent = true,
      desc = "Ledger Balance",
    }
  )
	end,
})
