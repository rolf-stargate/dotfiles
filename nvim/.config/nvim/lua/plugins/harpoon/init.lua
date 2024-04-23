local opts = { noremap = true, silent = true, desc = "Harpoon" }

vim.keymap.set("n", ",", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
vim.keymap.set("n", "<leader>0", "<cmd>lua require('harpoon.mark').add_file()<cr>", {
	noremap = true,
	silent = true,
	desc = "Add to Harpoon",
})
vim.keymap.set("n", "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", opts)
vim.keymap.set("n", "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", opts)
vim.keymap.set("n", "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", opts)
vim.keymap.set("n", "<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", opts)
