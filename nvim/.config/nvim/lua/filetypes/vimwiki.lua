-- |////|__ EVENTS __|////////////////////////////////////////////////////|»)-->
-- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.md",
	callback = function()
		local cmd = "task sync > /dev/null"
		local output = vim.fn.system(cmd)

		local exit_code = vim.v.shell_error

		if exit_code ~= 0 then
			print(output)
		end
	end,
})

vim.api.nvim_create_autocmd("CursorHold", {
	pattern = "*.md",
	callback = function()
		vim.cmd("lua require('hover').hover()")
	end,
})
-- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- <--(«|////////////////////////////////////////////////////|__ EVENTS __|////|

-- |////|__ FILETYPE __|//////////////////////////////////////////////////|»)-->
-- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
vim.api.nvim_create_autocmd("FileType", {
	pattern = "vimwiki",
	callback = function()
		-- =======  LOCAL OPTIONS  ====================================================>
		vim.cmd("setlocal softtabstop=3")
		vim.cmd("setlocal shiftwidth=3")
		vim.cmd("setlocal updatetime=100")
		-- <====================================================  LOCAL OPTIONS  =======

		-- =======  FORMATTING  =======================================================>
		vim.keymap.set(
			"v",
			"<leader>wfci",
			":s/- \\[ \\] \\(.*$\\)/- [ ] *\\1*/gI<cr>:nohl<cr>",
			{ buffer = true, noremap = true, desc = "Italic Checklist Items" }
		)
		vim.keymap.set(
			"v",
			"<leader>wfcb",
			":s/- \\[ \\] \\(.*$\\)/- [ ] **\\1**/gI<cr>:nohl<cr>",
			{ buffer = true, noremap = true, desc = "Bold Checklist Items" }
		)
		-- <=======================================================  FORMATTING  =======

		-- =======  MARKDOWN TABLE  ===================================================>
		vim.keymap.set(
			"n",
			"<leader>dd",
			":VimwikiTable ",
			{ buffer = true, noremap = true, desc = "Create 3x3 table" }
		)
		-- <===================================================  MARKDOWN TABLE  =======

		-- =======  MARKDOWN TO LATEX TO PDF  =========================================>
		vim.keymap.set(
			"n",
			"<leader>ol",
			":!pandoc % -o %.pdf --template=/home/rolf/.config/nvim/templates/letter.latex && brave %.pdf<cr>",
			{ buffer = true, noremap = true, desc = "Letter" }
		)
		vim.keymap.set(
			"n",
			"<leader>oa",
			":!pandoc % -o %.pdf --template=/home/rolf/Dropbox/wiki/template_application_2024_11_08_11:08:12.latex && brave %.pdf<cr>",
			{ buffer = true, noremap = true, desc = "Job Application" }
		)
		vim.keymap.set(
			"n",
			"<leader>op",
			':%s/%%.*$//g<cr>:!pandoc % --from=markdown --output=/tmp/%:t:r.pdf --variable=geometry:"margin=3cm, a4paper" && brave /tmp/%:t:r.pdf<cr><cr>u:w<cr>:nohl<cr>',
			{ buffer = true, noremap = true, desc = "Documentation" }
		)
		-- <=========================================  MARKDOWN TO LATEX TO PDF  =======

		-- =======  LLM CHAT BUFFER  ==================================================>
		vim.keymap.set(
			"n",
			"<C-g>g",
			"G?rolf:<cr>:nohlsearch<cr>A ",
			{ buffer = true, noremap = true, desc = "ChatGpt Jump to Input" }
		)
		vim.keymap.set(
			"i",
			"<C-g>g",
			"<esc>G?rolf:<cr>:nohlsearch<cr>A ",
			{ buffer = true, noremap = true, desc = "ChatGpt Jump to Input" }
		)
		-- <==================================================  LLM CHAT BUFFER  =======
	end,
})
-- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- <--(«|//////////////////////////////////////////////////|__ FILETYPE __|////|
