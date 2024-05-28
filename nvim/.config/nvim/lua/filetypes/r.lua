-- Function to run the R script and open the image
function Run_rscript_and_open_image()
    local base_name = Get_buffer_base_name()
    local command = string.format("!Rscript %s.R && feh %s.png", base_name, base_name)
    Change_to_buffer_dir_and_back(command)
end

-- Command to call the run_rscript_and_open_image function
vim.api.nvim_command('command! RunAndShowImage lua Run_rscript_and_open_image()')

vim.api.nvim_create_autocmd("FileType", {
	pattern = "r",
	callback = function()
		-- Use vim.keymap.set for Neovim 0.7 and above
		vim.keymap.set(
			"n",
			"<leader>RR",
			":RunAndShowImage<CR>",
			{ buffer = true, noremap = true, desc = "Execute" }
		)
	end,
})
