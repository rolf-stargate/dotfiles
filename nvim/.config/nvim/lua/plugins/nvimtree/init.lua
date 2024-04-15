-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- ### mappings ####################################################################
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<Leader>e", "<cmd>NvimTreeToggle<CR>", opts)

local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	print("on_attach")
	-- BEGIN_DEFAULT_ON_ATTACH
	-- vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
	-- vim.keymap.set("n", "<C-k>", api.node.show_info_popup, opts("Info"))
	-- vim.keymap.set("n", "<C-r>", api.fs.rename_sub, opts("Rename: Omit Filename"))
	-- vim.keymap.set("n", "<C-t>", api.node.open.tab, opts("Open: New Tab"))
	-- vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
	-- vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
	vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
	vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
	-- vim.keymap.set("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
	vim.keymap.set("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
	vim.keymap.set("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
	vim.keymap.set("n", "<C-p>", api.node.run.cmd, opts("Run Command"))
	-- vim.keymap.set("n", "-", api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set("n", "a", api.fs.create, opts("Create"))
	-- vim.keymap.set("n", "bd", api.marks.bulk.delete, opts("Delete Bookmarked"))
	-- vim.keymap.set("n", "bmv", api.marks.bulk.move, opts("Move Bookmarked"))
	vim.keymap.set("n", "B", api.tree.toggle_no_buffer_filter, opts("Toggle Filter: No Buffer"))
	vim.keymap.set("n", "yy", api.fs.copy.node, opts("Copy"))
	vim.keymap.set("n", "g", api.tree.toggle_git_clean_filter, opts("Toggle Filter: Git Clean"))
	-- vim.keymap.set("n", "[c", api.node.navigate.git.prev, opts("Prev Git"))
	-- vim.keymap.set("n", "]c", api.node.navigate.git.next, opts("Next Git"))
	vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
	vim.keymap.set("n", "D", api.fs.trash, opts("Trash"))
	vim.keymap.set("n", "E", api.tree.expand_all, opts("Expand All"))
	vim.keymap.set("n", "c", api.fs.rename_basename, opts("Rename: Basename"))
	vim.keymap.set("n", "]e", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
	vim.keymap.set("n", "[e", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
	vim.keymap.set("n", "Fc", api.live_filter.clear, opts("Clean Filter"))
	vim.keymap.set("n", "F", api.live_filter.start, opts("Filter"))
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
	vim.keymap.set("n", "yp", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
	vim.keymap.set("n", ".", api.tree.toggle_hidden_filter, opts("Toggle Filter: Dotfiles"))
	vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Filter: Git Ignore"))
	-- vim.keymap.set("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
	-- vim.keymap.set("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
	vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
	vim.keymap.set("n", "u", api.node.navigate.parent, opts("Parent Directory"))
	vim.keymap.set("n", "q", api.tree.close, opts("Close"))
	vim.keymap.set("n", "C", api.fs.rename, opts("Rename"))
	vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
	vim.keymap.set("n", "s", api.node.run.system, opts("Run System"))
	vim.keymap.set("n", "f", api.tree.search_node, opts("Search"))
	-- vim.keymap.set("n", "U", api.tree.toggle_custom_filter, opts("Toggle Filter: Hidden"))
	vim.keymap.set("n", "e", api.tree.collapse_all, opts("Collapse"))
	vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
	vim.keymap.set("n", "Y", api.fs.copy.filename, opts("Copy Name"))
	vim.keymap.set("n", "yP", api.fs.copy.relative_path, opts("Copy Relative Path"))
	vim.keymap.set("n", "r", api.tree.change_root_to_node, opts("CD"))
	-- END_DEFAULT_ON_ATTACH
end

-- OR setup with some options
require("nvim-tree").setup({
	on_attach = my_on_attach,
	auto_reload_on_write = true,
	hijack_unnamed_buffer_when_opening = true,
	hijack_cursor = true,
	sync_root_with_cwd = true,
	reload_on_bufenter = true,
	select_prompts = true,
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	diagnostics = {
		enable = true,
		debounce_delay = 50,
		show_on_dirs = true,
		icons = { hint = "", info = "", warning = "", error = "" },
	},
	system_open = {
		cmd = "xdg-open",
	},
	git = {
		enable = true,
		ignore = false,
		show_on_dirs = true,
		timeout = 400,
	},
	view = {
		adaptive_size = true,
		centralize_selection = true,
	},
	renderer = {
		group_empty = true,
		full_name = true,
		indent_width = 1,
		indent_markers = {
			enable = true,
			inline_arrows = false,
		},
		icons = {
			git_placement = "after",
			modified_placement = "after",
			symlink_arrow = " ➛ ",
		},
	},
	filters = {
		dotfiles = false,
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
		remove_file = {
			close_window = true,
		},
		use_system_clipboard = true,
	},
	modified = {
		enable = true,
		show_on_dirs = true,
	},
	log = {
		enable = false,
		truncate = false,
		types = {
			all = false,
			config = false,
			copy_paste = false,
			dev = false,
			diagnostics = false,
			git = false,
			profile = false,
			watcher = false,
		},
	},
	notify = {
		threshold = vim.log.levels.WARN,
	},
})

local function open_nvim_tree(data)
	-- buffer is a directory
	local directory = vim.fn.isdirectory(data.file) == 1

	if not directory then
		-- buffer is a real file on the disk
		local real_file = vim.fn.filereadable(data.file) == 1

		-- buffer is a [No Name]
		local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

		if real_file or not no_name then
			return
		end

		-- open the tree, find the file but don't focus it
		require("nvim-tree.api").tree.toggle({ focus = false, find_file = true })
		return
	end

	-- change to the directory
	vim.cmd.cd(data.file)

	-- open the tree
	require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
