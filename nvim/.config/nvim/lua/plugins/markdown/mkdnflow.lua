vim.api.nvim_create_autocmd("BufLeave", {
	pattern = "*.md",
	command = "update",
})

math.randomseed(os.time()) -- Seed once at the start of your program

local function generateUUID()
	local template = "xxxx"
	return string.gsub(template, "[xy]", function(c)
		local v = (c == "x") and math.random(0, 0xf) or math.random(8, 0xb)
		return string.format("%x", v)
	end)
end
-- ** DEFAULT SETTINGS; TO USE THESE, PASS NO ARGUMENTS TO THE SETUP FUNCTION **
--
require("mkdnflow").setup({
	modules = {
		bib = true,
		buffers = true,
		conceal = true,
		cursor = true,
		folds = true,
		links = true,
		lists = true,
		maps = true,
		paths = true,
		tables = true,
		yaml = false,
		cmp = true,
	},
	filetypes = { md = true, rmd = true, markdown = true },
	create_dirs = true,
	perspective = {
		priority = "root",
		fallback = "root",
		root_tell = "index.md",
		nvim_wd_heel = true,
		update = true,
	},
	wrap = false,
	bib = {
		default_path = nil,
		find_in_root = true,
	},
	silent = true,
	links = {
		style = "markdown",
		name_is_source = false,
		conceal = false,
		context = 0,
		implicit_extension = nil,
		transform_implicit = false,
		transform_explicit = function(text)
			text = text:gsub(" ", "-")
			text = text:lower()
			text = os.date("%Y-%m-%d__") .. generateUUID() .. "__" .. text
			return text
		end,
	},
	new_file_template = {
		use_template = true,
		placeholders = {
			before = {
				title = "link_title",
				date = "os_date",
			},
			after = {},
		},
		template = "# {{ title }}",
	},
	to_do = {
		symbols = { " ", "-", "X" },
		update_parents = true,
		not_started = " ",
		in_progress = "-",
		complete = "X",
	},
	tables = {
		trim_whitespace = true,
		format_on_move = true,
		auto_extend_rows = false,
		auto_extend_cols = false,
	},
	yaml = {
		bib = { override = false },
	},
	mappings = {
		MkdnEnter = { { "n", "v" }, "<CR>" },
		MkdnTab = false,
		MkdnSTab = false,
		MkdnNextLink = { "n", "<Tab>" },
		MkdnPrevLink = { "n", "<S-Tab>" },
		MkdnNextHeading = { "n", "]]" },
		MkdnPrevHeading = { "n", "[[" },
		MkdnGoBack = { "n", "<BS>" },
		MkdnGoForward = { "n", "<Del>" },
		MkdnCreateLink = false, -- see MkdnEnter
		MkdnCreateLinkFromClipboard = { { "n", "v" }, "<leader>p" }, -- see MkdnEnter
		MkdnFollowLink = false, -- see MkdnEnter
		MkdnDestroyLink = { "n", "<M-CR>" },
		MkdnMoveSource = { "n", "<F2>" },
		MkdnYankAnchorLink = { "n", "yaa" },
		MkdnYankFileAnchorLink = { "n", "yfa" },
		MkdnIncreaseHeading = { "n", "+" },
		MkdnDecreaseHeading = { "n", "-" },
		MkdnToggleToDo = { { "n", "v" }, "<C-Space>" },
		MkdnNewListItemBelowInsert = { "n", "o" },
		MkdnNewListItemAboveInsert = { "n", "O" },
		MkdnExtendList = false,
		MkdnUpdateNumbering = { "n", "<leader>nn" },
		MkdnTableNextCell = { "i", "<Tab>" },
		MkdnTablePrevCell = { "i", "<S-Tab>" },
		MkdnTableNextRow = false,
		MkdnTablePrevRow = { "i", "<M-CR>" },
		MkdnTableNewRowBelow = { "n", "<leader>ir" },
		MkdnTableNewRowAbove = { "n", "<leader>iR" },
		MkdnTableNewColAfter = { "n", "<leader>ic" },
		MkdnTableNewColBefore = { "n", "<leader>iC" },
	},
})
