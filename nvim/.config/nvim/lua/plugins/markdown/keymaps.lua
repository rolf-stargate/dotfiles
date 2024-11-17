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
	local wiki_path = vim.fn.getcwd() .. "/wiki"
	local index_file = wiki_path .. "/index.md"

	-- Check if the wiki directory exists, create it if not
	if vim.fn.isdirectory(wiki_path) == 0 then
		if ask_for_permission("Create wiki directory?") then
			os.execute("mkdir -p " .. wiki_path)
			if ask_for_permission("Create main wiki index file?") then
				os.execute("echo " .. "'[" .. vim.fn.getcwd() .. "](" .. index_file .. ")' >> ~/Dropbox/Wiki/index.md")
			end
			-- Check if the index.md file exists, open or create it
			if vim.fn.filereadable(index_file) == 0 then
				-- If file does not exist, create it and add initial content
				local file = io.open(index_file, "w")
				file:write("# Wiki Index\n\n# TODO\n\n# BUGS")
				file:close()
			end
		end
	end

	if vim.fn.filereadable(index_file) == 1 then
		vim.api.nvim_command("edit " .. index_file)
	end
end

function Insert_date_prefixed_text(prefix)
	local date = os.date("%Y-%m-%d") -- Formats the date as "YYYY-MM-DD"
	local text_to_insert = prefix .. "-" .. date
	-- Insert the text at the current cursor position
	vim.api.nvim_put({ text_to_insert }, "", true, true)
end

function Delete_current_buffer_if_md_and_switch_back()
	-- Get the name of the current file
	local current_file = vim.api.nvim_buf_get_name(0)

	-- Check if the file name ends with '.md'
	if current_file:match("%.md$") then
		-- Delete the file from the file system
		local success, err = os.remove(current_file)
		if success then
			-- Close the current buffer without saving
			vim.api.nvim_buf_delete(0, { force = true })
			-- Switch back to the previous buffer
			vim.cmd("silent! b#")
		else
			-- If there was an error deleting the file, display it
			print("Error deleting file: " .. err)
		end
	else
		-- If the file is not a Markdown file, display a message
		print("The current buffer is not a Markdown file.")
	end
end

Last_CWD_before_main_wiki = nil
Last_File_before_main_wiki = nil
function Toggle_Main_Wiki()
	if vim.fn.getcwd() == "/home/rolf/Dropbox/Wiki" then
		if Last_CWD_before_main_wiki ~= nil then
			vim.cmd("cd " .. Last_CWD_before_main_wiki)
			if not Last_File_before_main_wiki:match("NvimTree_1") then
				vim.cmd("edit " .. Last_File_before_main_wiki)
			else
				vim.cmd("NvimTreeOpen")
			end
			Last_CWD_before_main_wiki = nil
			Last_File_before_main_wiki = nil
		end
	else
		Last_File_before_main_wiki = vim.api.nvim_buf_get_name(0)
		print(Last_File_before_main_wiki)
		Last_CWD_before_main_wiki = vim.fn.getcwd()
		vim.cmd("cd ~/Dropbox/Wiki")
		vim.cmd("edit index.md")
	end
end

local wk = require("which-key")

wk.register({
	o = {
		name = "Wiki",
		o = {
			"<cmd>lua Toggle_Main_Wiki()<cr>",
			"Main Wiki",
			noremap = true,
		},
		l = { "<cmd>lua Open_or_create_wiki_index()<cr>", "Local Wiki", noremap = true },
		r = { "<cmd>MdEval<cr>", "Eval Code Block", noremap = true },
		i = { "<cmd>PasteImg<cr>", "Paste Image From Clipboard", noremap = true },
		D = {
			"<cmd>MkdnEnter<cr><cmd>lua Delete_current_buffer_if_md_and_switch_back()<cr><cmd>MkdnDestroyLink<cr>",
			"Destroy Link and Delete File",
			noremap = true,
		},
		t = {
			name = "Table",
			-- t = { "<cmd>MkdnTable 2 1<cr>", "Create Table", noremap = true },
			-- j = { "<cmd>MkdnTableNewRowBelow<cr>", "New Row Below", noremap = true },
			-- k = { "<cmd>MkdnTableNewRowAbove<cr>", "New Row Above", noremap = true },
			-- h = { "<cmd>MkdnTableNewColBefore<cr>", "New Col Before", noremap = true },
			-- l = { "<cmd>MkdnTableNewColAfter<cr>", "New Col After", noremap = true },
		},
		L = {
			"<cmd>!pandoc % -o %.pdf --template=/home/rolf/Dropbox/Templates/Pandoc/letter.latex && brave %.pdf<cr>",
			"Print Letter",
			noremap = true,
		},
	},
}, {
	mode = "n",
	prefix = "<Leader>",
})
