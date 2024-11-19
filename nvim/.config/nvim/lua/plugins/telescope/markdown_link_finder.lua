local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
	print("Telescope is not installed")
	return
end

local actions = require("telescope.actions")
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local previewers = require("telescope.previewers")
local entry_display = require("telescope.pickers.entry_display")
local make_entry = require("telescope.make_entry")
local action_state = require("telescope.actions.state")

local conf = require("telescope.config").values

-- Custom Finder
function markdown_link_finder(opts)
	opts = opts or {}

	local search_dir = "/home/rolf/Dropbox/wiki/"
	local results = {}
	local file_list_command = string.format("find %s -mindepth 1 -maxdepth 1 -type f -name '*.md' | cat", search_dir)

	for file in io.popen(file_list_command):lines() do
		local file_cat = string.format("cat %s", file)

		for line in io.popen(file_cat):lines() do
			if string.find(line, "file:") then
				print("file")
			else
				local link, filename, _ = line:match("%[([^]]+)%]%(([^)]+)%)")
				if filename and link then
					table.insert(results, { filename = filename .. ".md", link = link, path = search_dir })
				end
			end
		end
	end

	pickers
		.new(opts, {
			prompt_title = "Find Markdown Links",
			finder = finders.new_table({
				results = results,
				entry_maker = function(entry)
					return {
						value = entry,
						display = entry.link .. " --> " .. entry.filename,
						ordinal = entry.link .. " " .. entry.filename,
						path = entry.path .. entry.filename,
					}
				end,
			}),
			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local entry = action_state.get_selected_entry()
					if entry then
						local link = entry.value.link
						local filename = entry.value.filename
						local current_line = vim.fn.line(".")
						vim.fn.append(current_line, "[" .. link .. "](" .. filename .. ")")
					end
				end)

				return true
			end,
			previewer = previewers.new_termopen_previewer({
				get_command = function(entry)
					return { "nvim", entry.path }
					-- return { "bat", entry.path }
				end,
			}),
			sorter = conf.generic_sorter(opts),
		})
		:find()
end

-- Map this to a key or call directly with :lua
vim.cmd([[ command! MarkdownLinkFinder lua markdown_link_finder() ]])
