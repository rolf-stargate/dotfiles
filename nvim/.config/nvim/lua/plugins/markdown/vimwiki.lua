vim.g.vimwiki_auto_header = 1
vim.g.vimwiki_folding = "manual"
vim.g.vimwiki_auto_chdir = 1

vim.g.vimwiki_ext2syntax = {
	[".md"] = "markdown",
	[".markdown"] = "markdown",
	[".mdown"] = "markdown",
}

local function get_last_folder_name(path)
	-- Normalize the path by removing a trailing slash if it exists
	path = string.gsub(path, "/$", "")

	-- Capture the last folder name after the last slash
	local name = string.match(path, ".*/(.*)")
	return name
end

local function ask_for_permission(question)
	local answer = vim.fn.confirm(question, "&Yes\n&No", 2)
	if answer == 1 then
		print("User gave permission.")
		return true
	else
		print("User denied permission.")
		return false
	end
end

function Open_or_create_wiki_index()
	local cwd = vim.fn.getcwd()
	local project_name = get_last_folder_name(cwd)
	local wiki_path = cwd .. "/wiki"
	local index_file = wiki_path .. "/index.md"

	-- Check if the wiki directory exists, create it if not
	if vim.fn.isdirectory(wiki_path) == 0 then
		if ask_for_permission("Create wiki directory?") then
			os.execute("mkdir -p " .. wiki_path)
			-- Check if the index.md file exists, open or create it
			if vim.fn.filereadable(index_file) == 0 then
				-- If file does not exist, create it and add initial content
				local file = io.open(index_file, "w")

				if file then
					-- Ask if to use parent folder name as project name
					if not ask_for_permission("The project name is " .. project_name .. "?") then
						project_name = vim.fn.input("Enter project name: ")
					end

					project_name = string.gsub(project_name, " ", "-")

					file:write(
						"# "
							.. project_name
							.. " || project:"
							.. project_name
							.. "\n\n## Notes\n\n## TODAY | due:today or due:tomorrow or status:overdue \n\n## TODO | status:pending -bug due.not:tomorrow due.not:today\n\n## Bugs | status:pending +bug due.not:tomorrow due.not:today\n\n## Archive | status:Completed"
					)
					file:close()
				end
			end
		end
	end

	if vim.fn.filereadable(index_file) == 1 then
		vim.api.nvim_command("edit " .. index_file)
	end
end

-- Create command to update vimwiki list with project wikis
vim.keymap.set(
	"n",
	"<Leader>wp",
	":lua Open_or_create_wiki_index()<CR>",
	{ noremap = true, desc = "Open or create wiki index" }
)

-- paste image from clipboard
function Paste_Image_From_Clipboard()
	local buffer_path = vim.fn.expand("%:p:h")
	local file_name_uuid = Gen_uuid(5)
	print(file_name_uuid)

	local img_dir = buffer_path .. "/img"
	if vim.fn.isdirectory(img_dir) == 0 then
		os.execute("mkdir -p " .. img_dir)
	end

	os.execute("xclip -selection clipboard -t image/png -o > '" .. buffer_path .. "/img/" .. file_name_uuid .. ".png'")

	local link = "![Image](./img/" .. file_name_uuid .. ".png)"
	vim.api.nvim_set_current_line(link)
end

-- function delete image under cursor
function Delete_Image_From_Link()
	local line = vim.api.nvim_get_current_line()
	local buffer_path = vim.fn.expand("%:p:h")

	local pattern = "!%[.*%]%((%.?/img/[^)]+)%)"
	print(line)
	local path = buffer_path .. line:match(pattern):gsub("^%./", "/")

	if path then
		local confirmation = vim.fn.input("Are you sure you want to delete the file at:\n" .. path .. "? (y/n) ")
		if confirmation == "y" then
			os.remove(path)
			print("File deleted.")
		else
			print("File deletion canceled.")
		end
	else
		print("No path provided.")
	end
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = "vimwiki",
	callback = function()
		vim.api.nvim_buf_set_keymap(
			0,
			"i",
			"<CR>",
			"<C-]><Esc>:VimwikiReturn 3 5<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_buf_set_keymap(0, "i", "<S-CR>", "<Esc>:VimwikiReturn 2 2<CR>", { noremap = true, silent = true })

		vim.api.nvim_buf_set_keymap(0, "n", "<S-CR>", "A<Esc>:VimwikiReturn 2 2<CR>", { noremap = true, silent = true })

		vim.keymap.set(
			"n",
			"<Leader>wP",
			":lua Paste_Image_From_Clipboard()<CR>",
			{ noremap = true, desc = "Paste Image From Clipboard" }
		)
		vim.keymap.set(
			"n",
			"<Leader>wD",
			":lua Delete_Image_From_Link()<CR>",
			{ noremap = true, desc = "Delete Image From Link" }
		)

		vim.keymap.set(
			"n",
			"<Leader>wll",
			"<cmd>!pandoc % -o %.pdf --template=/home/rolf/.config/nvim/templates/letter.latex && brave %.pdf<cr><cr>",
			{ noremap = true, desc = "Print Letter" }
		)

		vim.keymap.set("n", "<Leader>wtt", ":VimwikiTable", { noremap = true, desc = "Create Table" })

		vim.keymap.set(
			"n",
			"<Leader>wth",
			":VimwikiTableMoveColumnRight<CR>",
			{ noremap = true, desc = "Table Move Column Right" }
		)

		vim.keymap.set(
			"n",
			"<Leader>wtl",
			":VimwikiTableMoveColumnLeft<CR>",
			{ noremap = true, desc = "Table Move Column Left" }
		)

		vim.keymap.set("n", "<Leader>wo", "80i-<esc>O<esc>jo<esc>k", { noremap = true, desc = "Line Seperator" })

		vim.cmd([[
      function! VimwikiLinkHandler(link)
          let link = a:link
          if link =~# '^file:'
            let link_file = substitute(link,'^file:', '', 'g')
              try
                  " Substitute '/' or any unwanted characters with a valid file name format
                  let link_file = substitute(link_file, '\/', '_', 'g')
                  " Set the directory and file path
                  let file_path = expand('~/Dropbox/wiki/' . link_file)

                  " Check if the file exists
                  if filereadable(file_path)
                      " If the file exists, open it in the current buffer
                      execute 'edit ' . file_path
                  else
                      " If not, create a new file and open it in the current buffer
                      call writefile([''], file_path) " Creates an empty file
                      execute 'edit ' . file_path
                  endif
                  return 1
              catch
                  echo "This can happen for a variety of reasons ..."
              endtry
              return 0
          else
            return 0
      endfunction
    ]])
	end,
})
