vim.g.vimwiki_auto_header = 1
vim.g.vimwiki_list = {
	{
		path = "~/Dropbox/vimwiki/",
		links_space_char = "_",
		syntax = "markdown",
		ext = ".md",
		nested_syntaxes = "{'python': 'python', 'cpp': 'cpp', 'sh': 'sh', 'bash': 'bash', 'javascript': 'javascript'}",
	},
}
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
	local file_name = vim.fn.input("Enter file name: "):gsub(" ", "-")
	local file_name_uuid = vim.fn.system("uuidgen"):gsub("\n", "")

	os.execute(
		"xclip -selection clipboard -t image/png -o > '" .. buffer_path .. "/" .. file_name .. file_name_uuid .. ".png'"
	)

	local link = "![file_name](" .. file_name .. file_name_uuid .. ".png)"

	vim.api.nvim_set_current_line(link)
end

vim.keymap.set(
	"n",
	"<Leader>wP",
	":lua Paste_Image_From_Clipboard()<CR>",
	{ noremap = true, desc = "Paste image from clipboard" }
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
