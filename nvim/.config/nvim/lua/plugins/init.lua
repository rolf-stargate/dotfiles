-- |////|__ SETUP PACKAGE MANAGER(LAZY) __|///////////////////////////////|»)-->
-- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
-- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- <--(«|///////////////////////////////|__ SETUP PACKAGE MANAGER(LAZY) __|////|

-- |////|__ PLUGINS __|///////////////////////////////////////////////////|»)-->
-- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
local plugins = {
	-- =======  UTILITIES  ======================================================>
	-- Plenary
	{ "nvim-lua/plenary.nvim" }, -- Useful lua functions used ny lots of plugins
	-- Nvim-Surround
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = true,
	},
	-- Auto Pairs
	{ "windwp/nvim-autopairs" },
	-- Vim Repeat
	{ "tpope/vim-repeat" },
	-- Comment
	{ "numToStr/Comment.nvim" },
	-- Minimove
	{ "echasnovski/mini.nvim", version = "*" }, -- Indentation with ALT+h/j/k/l
	-- <======================================================  UTILITIES  =======

	-- =======  LLMS  ===========================================================>
	--  ---------------------------------------------------------  Unused  -------
	-- { "robitx/gp.nvim" }, -- LLM integration
	-- Copilot
	-- { "zbirenbaum/copilot-cmp", after = { "copilot.lua", "nvim-cmp" }},
	-- { "zbirenbaum/copilot.lua" },
	-- Tabnine
	-- { "codota/tabnine-nvim", build = "./dl_binaries.sh" },
	--  ---------------------------------------------------------  Unused  -------
	{
		"frankroeder/parrot.nvim",
		event = "VeryLazy",
		dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
	},
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false, -- set this if you want to always pull the latest change
		opts = {
			provider = "openai",
			auto_suggestions_provider = "openai", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
			openai = {
				endpoint = "https://api.deepseek.com/v1",
				model = "deepseek-chat",
				timeout = 30000, -- Timeout in milliseconds
				temperature = 0,
				max_tokens = 4096,
				-- optional
				api_key_name = "DEEPSEEK_API_KEY", -- default OPENAI_API_KEY if not set
			},
			windows = {
				position = "bottom",
			},
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante", "vimwiki" },
				},
				ft = { "markdown", "Avante", "vimwiki" },
			},
		},
	},
	-- <===========================================================  LLMS  =======

	-- =======  APPEARANCE  =====================================================>
	-- Color Schemes
	{ "Abstract-IDE/Abstract-cs" },
	{ "rafamadriz/neon" },
	-- Indent Blankline
	{ "lukas-reineke/indent-blankline.nvim", version = "2.20.8" }, -- Indent visualization
	-- Illuminate
	{ "RRethy/vim-illuminate" }, -- Highlight repeated words
	-- Statusline
	{ "windwp/windline.nvim" },
	-- Gitsigns
	{ "lewis6991/gitsigns.nvim" },
	-- Clear Search Highlight when moving
	{ "haya14busa/is.vim" },
	-- Colorizer
	{ "norcalli/nvim-colorizer.lua" }, -- Highlight colors
	-- <=====================================================  APPEARANCE  =======

	-- =======  MY PLUGINS  =====================================================>
	-- Ankifly
	{ dir = "/home/rolf/Dropbox/work/rolfworld/programming/projects/ankifly.nvim" },
	-- { "rolf-stargate/ankifly.nvim", branch = "develop" },
	-- <=====================================================  MY PLUGINS  =======

	-- =======  MOVEMENT  =======================================================>
	-- Markw
	{ "chentoast/marks.nvim" }, -- Marks preview window
	-- <=======================================================  MOVEMENT  =======
	-- <===========================================================  EXTERN  =======
	{
		"mikesmithgh/kitty-scrollback.nvim",
		enabled = true,
		lazy = true,
		cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
		event = { "User KittyScrollbackLaunch" },
		-- version = '*', -- latest stable version, may have breaking changes if major version changed
		-- version = '^6.0.0', -- pin major version, include fixes and features that do not have breaking changes
		config = function()
			require("kitty-scrollback").setup()
		end,
	},
	-- <==========================================================>  EXTERN  <======
	-- =======  NAVIGATION  =====================================================>
	-- Neotree
	{ "nvim-tree/nvim-web-devicons" },
	{
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	-- Harpoon
	{ "ThePrimeagen/harpoon" },
	-- Neoscroll
	{ "rolf-stargate/neoscroll.nvim" },
	-- <=====================================================  NAVIGATION  =======

	-- =======  UI  =============================================================>
	-- Dressing
	{ "stevearc/dressing.nvim" }, -- Better Menus
	-- Better Quickfix Window
	{ "kevinhwang91/nvim-bqf" },
	-- Which-Key
	{ "folke/which-key.nvim" },
	-- Popup API
	{ "nvim-lua/popup.nvim" },
	-- Floaterm
	{ "voldikss/vim-floaterm" },
	-- Undotree
	{ "simnalamburt/vim-mundo" },
	-- ColorPicker
	{ "blindFS/vim-colorpicker" },
	-- Hover
	{ "lewis6991/hover.nvim" }, -- Used for LSP
	-- <=============================================================  UI  =======

	-- =======  LSP  ============================================================>
	{ "mhartington/formatter.nvim" },
	{ "rushjs1/nuxt-goto.nvim" },
	{ "VonHeikemen/lsp-zero.nvim" },
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	{ "neovim/nvim-lspconfig" },
	{ "nanotee/sqls.nvim" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-omni" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "onsails/lspkind.nvim" },
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use
	-- <============================================================  LSP  =======

	-- =======  DEBUGGING  ======================================================>
	{
		"sakhnik/nvim-gdb",
		init = function()
			vim.g.nvimgdb_disable_start_keymaps = true

			vim.g.nvimgdb_config_override = {
				jump_bottom_gdb_buf = true,
				set_scroll_off = 20,
			}
		end,
	},
	-- <======================================================  DEBUGGING  =======

	-- =======  SEARCH  =========================================================>
	-- nvim-spectre
	{ "nvim-pack/nvim-spectre" },
	-- Telescope
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-telescope/telescope-media-files.nvim" },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "ghassan0/telescope-glyph.nvim" },
	{
		"dhruvmanila/browser-bookmarks.nvim",
		version = "*",
	},
	-- <=========================================================  SEARCH  =======

	-- =======  TREESITTER  =====================================================>
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	},
	{ "nvim-treesitter/playground" },
	{ "nvim-treesitter/nvim-treesitter-context" },
	-- <=====================================================  TREESITTER  =======

	-- =======  MARKDOWN  =======================================================>
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "mupdf"
		end,
	},
	{
		"rolf-stargate/vimwiki",
		branch = "dev",
		init = function()
			vim.g.vimwiki_list = {
				{
					path = "/home/rolf/wiki/docu",
					name = "d",
					links_space_char = "_",
					syntax = "markdown",
					ext = ".md",
				},
				{
					path = "/home/rolf/wiki/proj",
					name = "p",
					links_space_char = "_",
					syntax = "markdown",
					ext = ".md",
				},
				{
					path = "/home/rolf/wiki/sec",
					name = "s",
					links_space_char = "_",
					syntax = "markdown",
					ext = ".md",
					template_path = "/home/rolf/wiki/templates/",
					template_default = "default",
					custom_wiki2markdown = "vimwiki_markdown",
					html_filename_parameterization = 1,
					template_ext = ".tpl",
				},
				{
					path = "/home/rolf/wiki/tasks",
					name = "t",
					links_space_char = "_",
					syntax = "markdown",
					ext = ".md",
				},
				{
					path = "/home/rolf/wiki/web",
					name = "w",
					links_space_char = "_",
					syntax = "markdown",
					ext = ".md",
				},
			}
		end,
	},

	{ "mipmip/vim-scimark" },
	{ "mattn/calendar-vim" },
	{ "tools-life/taskwiki" },
	{ "ledger/vim-ledger" },
	{ "3rd/image.nvim" },
	{ "TobinPalmer/pastify.nvim" },
	{ "jubnzv/mdeval.nvim" },
	{ "jbyuki/venn.nvim" },
	-- <=======================================================  MARKDOWN  =======
}
-- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- <--(«|///////////////////////////////////////////////////|__ PLUGINS __|////|

local opts = {}
require("lazy").setup(plugins, opts)

-- Load Plugin Configs
-- |////|__ LOAD PLUGIN CONFIGS __|///////////////////////////////////////|»)-->
-- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
require("plugins.LSP")
require("plugins.treesitter")
require("plugins.whichkey")
require("plugins.ankifly")
require("plugins.harpoon")
require("plugins.dressing")
require("plugins.windline")
require("plugins.gitsigns")
require("plugins.telescope")
require("plugins.undo")
require("plugins.debugging")
require("plugins.neoscroll")
require("plugins.nvimtree")
require("plugins.comment")
require("plugins.indent_blankline")
require("plugins.autopairs")
require("plugins.colorpicker")
require("plugins.colorizer")
require("plugins.nvim_web_devicons")
require("plugins.snippets")
require("plugins.markdown")
require("plugins.minimove")
require("plugins.hover")
require("plugins.LLM")
require("plugins.marks")
require("plugins.spectre")

-- require("plugins.tabnine")
-- require("plugins.copilot")
-- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- <--(«|///////////////////////////////////////|__ LOAD PLUGIN CONFIGS __|////|
