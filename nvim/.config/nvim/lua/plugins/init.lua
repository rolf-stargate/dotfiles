-- Plugin Manager
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

local plugins = {
  -- ColorSchemes
  { 'Abstract-IDE/Abstract-cs' },
  { 'rafamadriz/neon' },
  -- Which-Key
  { "folke/which-key.nvim" },
  -- My Plugin
  { "rolf-stargate/ankifly.nvim" },
  -- Nvim-Surround
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = true,
  },
  -- Vim Repeat
  { "tpope/vim-repeat" },
  -- Indent Blankline
  { "lukas-reineke/indent-blankline.nvim", version = "2.20.8" },
  -- Comment
  { "numToStr/Comment.nvim" },
  -- Illuminate
  { "RRethy/vim-illuminate" },
  -- Harpoon
  { "ThePrimeagen/harpoon" },
  -- Dressing
  { "stevearc/dressing.nvim" },
  -- Statusline
  { "windwp/windline.nvim" },
  -- Gitsigns
  { "lewis6991/gitsigns.nvim" },
  -- Clear Search Highlight when moving
  { "haya14busa/is.vim" },
  -- Better Quickfix Window
  { "kevinhwang91/nvim-bqf" },
  -- Popup API
  { "nvim-lua/popup.nvim" },
  -- Floaterm
  { "voldikss/vim-floaterm" },
  -- Undotree
  { "simnalamburt/vim-mundo" },
  -- Colorizer
  { "norcalli/nvim-colorizer.lua" },
  -- ColorPicker
  { "blindFS/vim-colorpicker" },
  -- Auto Pairs
  { "windwp/nvim-autopairs" },
  -- Neoscroll
  { "rolf-stargate/neoscroll.nvim" },
  -- Copilot
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua", "nvim-cmp" },
  },
  { "zbirenbaum/copilot.lua" },
  -- Debugging
  { "theHamsta/nvim-dap-virtual-text" },
  { "mfussenegger/nvim-dap" },
  { "rcarriga/nvim-dap-ui",                     dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
  -- Plenary
  { "nvim-lua/plenary.nvim" },    -- Useful lua functions used ny lots of plugins
  -- CMP Plugins
  { "hrsh7th/nvim-cmp" },         -- The completion plugin
  { "hrsh7th/cmp-buffer" },       -- buffer completions
  { "hrsh7th/cmp-path" },         -- path completions
  { "hrsh7th/cmp-cmdline" },      -- cmdline completions
  { "saadparwaiz1/cmp_luasnip" }, -- snippet completions
  { "hrsh7th/cmp-nvim-lsp" },
  { "alexaandru/nvim-lspupdate" },
  -- LSP Plugins
  { "neovim/nvim-lspconfig" },             -- enable LSP
  { "williamboman/mason.nvim" },           -- simple to use language server installer
  { "williamboman/mason-lspconfig.nvim" }, -- simple to use language server installer
  { "onsails/lspkind.nvim" },
  { "mfussenegger/nvim-lint" },
  -- Snippits
  { "L3MON4D3/LuaSnip" },             --snippet engine
  { "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use
  -- Telescope
  { "nvim-telescope/telescope.nvim" },
  { "nvim-telescope/telescope-media-files.nvim" },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  {
    "dhruvmanila/browser-bookmarks.nvim",
    version = "*",
  },
  -- Neotree
  { "nvim-tree/nvim-web-devicons" },
  {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  },
  { "nvim-treesitter/playground" },
  { "nvim-treesitter/nvim-treesitter-context" },

  -- ###  #########################################################################
  -- ### Markdown #################################################################
  -- ###  #########################################################################
  {
    "vimwiki/vimwiki",
    branch = "dev",
    init = function()
      vim.g.vimwiki_list = {
        {
          path = '~/Dropbox/wiki',
          syntax = 'markdown',
          ext = '.md',
        },
      }
    end
  },
  { "tools-life/taskwiki" },
  { "ledger/vim-ledger" },
  { "3rd/image.nvim" },
  { "TobinPalmer/pastify.nvim" },
  --   { "AckslD/nvim-FeMaco.lua",     config = 'require("femaco").setup()' },
  { "jubnzv/mdeval.nvim" },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  { 'echasnovski/mini.nvim', version = '*' },
  { "jbyuki/venn.nvim" }
}

local opts = {}

require("lazy").setup(plugins, opts)

-- Load Plugin Configs
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
require("plugins.copilot")
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
