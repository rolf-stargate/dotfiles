local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local wk = require("which-key")
wk.register({
	f = {
		name = "Find",
		-- Telescope
		f = {
			"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({ previewer = false}))<cr>",
			"Find File",
			noremap = true,
		},
		F = {
			"<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<cr>",
			"Current Buffer fuzzy",
			noremap = true,
		},
		b = { "<cmd>Telescope bookmarks<cr>", "Brave Bookmarks", noremap = true },
		g = { "<cmd>Telescope live_grep<cr>", "Live Grep", noremap = true },
		c = { "<cmd>lua require'telescope.builtin'.commands{}<cr>", "Commands", noremap = true },
		w = { "<cmd>lua require'telescope.builtin'.grep_string{}<cr>", "Grep String", noremap = true },
		M = { "<cmd>lua require'telescope.builtin'.man_pages{}<cr>", "Man Pages", noremap = true },
		q = { "<cmd>lua require'telescope.builtin'.quickfix{}<cr>", "Quickfix", noremap = true },
		v = { "<cmd>lua require'telescope.builtin'.vim_options{}<cr>", "Vim Options", noremap = true },
		k = { "<cmd>lua require'telescope.builtin'.keymaps{}<cr>", "Keymaps", noremap = true },
		h = { "<cmd>lua require'telescope.builtin'.highlights{}<cr>", "Heighlights", noremap = true },
	},
}, {
	mode = "n",
	prefix = "<Leader>",
})

local actions = require("telescope.actions")

telescope.setup({
	defaults = {

		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		layout_strategy = "vertical",
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		rep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
		mappings = {
			i = {
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,

				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,

				["<C-c>"] = actions.close,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,

				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["<Tab>"] = actions.toggle_selection,
				["<S-Tab>"] = actions.toggle_selection,
				["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-l>"] = actions.complete_tag,
				["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
			},

			n = {
				["<esc>"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<Tab>"] = actions.toggle_selection,
				["<S-Tab>"] = actions.toggle_selection,
				["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,

				["<C-b>"] = actions.preview_scrolling_up,
				["<C-f>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["?"] = actions.which_key,
			},
		},
	},
	-- pickers = {
	-- Default configuration for builtin pickers goes here:
	-- picker_name = {
	--   picker_config_key = value,
	--   ...
	-- }
	-- Now the picker_config_key will be applied every time you call this
	-- builtin picker
	-- },
	extensions = {
		media_files = {
			-- filetypes whitelist
			-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
			filetypes = { "png", "webp", "jpg", "jpeg" },
			find_cmd = "rg", -- find command (defaults to `fd`)
		},
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
})

telescope.load_extension("media_files")
telescope.load_extension("fzf")
require("telescope").load_extension("bookmarks")

-- This is your opts table
require("telescope").setup {
  extensions = {
  }
}
