vim.keymap.set("n", "<leader>rss", '<cmd>lua require("spectre").toggle()<CR>', {
	desc = "Toggle Spectre",
})
vim.keymap.set("n", "<leader>rsf", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
	desc = "Search on current file",
})
