-- |////|__ EVENTS __|////////////////////////////////////////////////////|»)-->
-- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.md",
	callback = function()
		local cmd = "task sync > /dev/null &"
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

-- |////|__ FUNCTIONS __|/////////////////////////////////////////////////|»)-->
-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

function Yt_links_from_selection_to_mpv()
	-- Get visual selection
	local selection = Get_visual_selection()
	if selection == "" then
		print("No text selected")
		return
	end

	local filename = Gen_uuid(10)
	local tmp_path = Save_string_to_tmp_file(selection, filename)
	local cmd = "play_md_links " .. tmp_path
	local handle = io.popen(cmd)
	handle:close()
end

-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- <--(«|/////////////////////////////////////////////////|__ FUNCTIONS __|////|

-- |////|__ FILETYPE __|//////////////////////////////////////////////////|»)-->
-- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

vim.api.nvim_create_autocmd("FileType", {
	pattern = "vimwiki",
	callback = function()
		-- <================================================  LOCAL OPTIONS  =======
		vim.cmd("setlocal softtabstop=3")
		vim.cmd("setlocal shiftwidth=3")
		vim.cmd("setlocal updatetime=100")
		vim.cmd("setlocal foldmethod=manual")

		-- <=================================  FIND EXISTING MARKDOWN LINKS  =======
		vim.api.nvim_set_keymap("n", "<leader>wf", ":MarkdownLinkFinder<CR>", { noremap = true, silent = true })

		-- <===============================================  TAG COMPLETION  =======
		vim.keymap.set("i", ":", ":<c-x><c-o>", { buffer = true, noremap = true, desc = "Test" })

		-- <===================================================  FORMATTING  =======

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

		-- <===============================================  MARKDOWN TABLE  =======

		vim.keymap.set(
			"n",
			"<leader>wtc",
			":VimwikiTable ",
			{ buffer = true, noremap = true, desc = "Create 3x3 table" }
		)

		-- <==================================================  BOLD ITALIC  =======

		vim.keymap.set(
			"v",
			"<leader>i",
			's**<c-r><c-o>"**',
			{ buffer = true, noremap = true, desc = "Wrap Visual Selection with *" }
		)

		vim.keymap.set(
			"v",
			"<leader>i",
			's*<c-r><c-o>"*',
			{ buffer = true, noremap = true, desc = "Wrap Visual Selection with *" }
		)

		-- <=====================================  MARKDOWN TO LATEX TO PDF  =======

		vim.keymap.set(
			"n",
			"<leader>ol",
			":execute 'normal ggo#[pdf](file:./out/)' . expand('%:t:r') . '.pdf'<cr>:!pandoc % -o %:h/out/%:t:r.pdf --template=/home/rolf/wiki/tasks/doc/letter_template.latex && brave %:h/out/%:t:r.pdf<cr>",
			{ buffer = true, noremap = true, desc = "Letter" }
		)
		vim.keymap.set(
			"n",
			"<leader>oa",
			":execute 'normal ggo#[pdf](file:./out/)' . expand('%:t:r') . '.pdf'<cr>:!pandoc % -o %:h/out/%:t:r.pdf --template=/home/rolf/wiki/tasks/doc/application_template.latex && brave %:h/out/%:t:r.pdf<cr>",
			{ buffer = true, noremap = true, desc = "Job Application" }
		)
		vim.keymap.set(
			"n",
			"<leader>od",
			":!md_to_pdf_live_preview % %:h/out/%:t:r.pdf<cr>",
			{ buffer = true, noremap = true, desc = "Documentation" }
		)
		vim.keymap.set(
			"n",
			"<leader>op",
			":!pandoc -F mermaid-filter --from markdown --to beamer % --template ~/.config/nvim/templates/eisvogel -o %:h/out/%:t:r.pdf && pdfpc %:h/out/%:t:r.pdf<cr>",
			{ buffer = true, noremap = true, desc = "Presentation" }
		)

		-- <==============================================  LLM CHAT BUFFER  =======

		vim.keymap.set(
			"n",
			"<C-g>g",
			"G?\\*rolf\\*:<cr>:nohlsearch<cr>A ",
			{ buffer = true, noremap = true, desc = "ChatGpt Jump to Input" }
		)
		vim.keymap.set(
			"i",
			"<C-g>g",
			"<esc>G?\\*rolf\\*:<cr>:nohlsearch<cr>A ",
			{ buffer = true, noremap = true, desc = "ChatGpt Jump to Input" }
		)

		--  =========================================  ADD_WEB_LINKS_TO_MPV  =======

		vim.keymap.set(
			"n",
			"<leader>wM",
			":!play_md_links %:p<cr><cr>",
			{ buffer = true, noremap = true, desc = "Add Web Links to MPV Player" }
		)

		vim.keymap.set(
			"v",
			"<leader>wM",
			":lua Yt_links_from_selection_to_mpv()<cr>",
			{ buffer = true, noremap = true, desc = "Add Web Links to MPV Player" }
		)
	end,
})
-- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- <--(«|//////////////////////////////////////////////////|__ FILETYPE __|////|
