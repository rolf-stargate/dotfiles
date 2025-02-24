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
function Test_for_vimwiki_link_from_visual_selection(path)
	local name = Get_visual_selection()
	name = name:gsub("^%s*(.-)%s*$", "%1")
	print("Searching: " .. name)

	local cmd = "grep --include=\\*.md -Eorh " .. path .. " -e '\\[[^]\\[]*\\]\\(.*\\)' | sort | uniq"
	local lines = Get_cmd_output(cmd)

	local match = false
	for i, line in ipairs(lines) do
		if line:find(name) then
			match = true
			print("Found:" .. line)
			Append_line_below(line)
		end
	end
	if match ~= true then
		print("No Matching Link Found")
	end
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
		-- <================================================  LOCAL OPTIONS  =======

		-- <=================================  FIND EXISTING MARKDOWN LINKS  =======
		vim.api.nvim_set_keymap("n", "<leader>wf", ":MarkdownLinkFinder<CR>", { noremap = true, silent = true })
		-- <=================================  FIND EXISTING MARKDOWN LINKS  =======

		-- <===================================================  TAG COMPLETION  =======
		-- vim.keymap.set("i", ":", ":<c-x><c-o>", { buffer = true, noremap = true, desc = "Test" })
		-- <==================================================>  TAG COMPLETION  <======

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
		-- <===================================================  FORMATTING  =======

		-- <===============================================  MARKDOWN TABLE  =======
		vim.keymap.set(
			"n",
			"<leader>wtc",
			":VimwikiTable ",
			{ buffer = true, noremap = true, desc = "Create 3x3 table" }
		)
		-- <===============================================  MARKDOWN TABLE  =======

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
		-- <=================================================>  BOLD ITALIC  <======

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
			":!pandoc -F mermaid-filter --from markdown --to beamer % --template ~/.config/nvim/templates/eisvogel.latex -o %:h/out/%:t:r.pdf",
			{ buffer = true, noremap = true, desc = "Presentation" }
		)
		-- <=====================================  MARKDOWN TO LATEX TO PDF  =======

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
		-- <==============================================  LLM CHAT BUFFER  =======
		--  =========================================  ADD_WEB_LINKS_TO_MPV  =======
		vim.keymap.set(
			"n",
			"<leader>wM",
			":!play_md_links %:p<cr><cr>",
			{ buffer = true, noremap = true, desc = "Add Web Links to MPV Player" }
		)
		--  =========================================  ADD_WEB_LINKS_TO_MPV  =======
	end,
})
-- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- <--(«|//////////////////////////////////////////////////|__ FILETYPE __|////|
