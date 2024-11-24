local ls = require("luasnip")
ls.config.setup({
	enable_autosnippets = true,
})

-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

vim.keymap.set({ "i", "s" }, "<C-J>", function()
	ls.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-K>", function()
	ls.jump(-1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })

local date = function()
	return { os.date("%Y-%m-%d") }
end

local year = function()
	return { os.date("%Y") }
end

local dateDE = function()
	return { os.date("%d.%m.%Y") }
end

ls.add_snippets(nil, {
	all = {},
	vue = {
		snip({
			trig = "vuebase",
			namr = "Vue base",
			dscr = "Vue with pug compesition and scoped scss",
		}, {
			text({ "<template lang='pug'>", "" }),
			insert(1),
			text({ "", "</template>" }),
			text({ "", "" }),
			text({ "", "" }),
			text({ "<script lang='ts'>", "" }),
			text({ "export default {", "" }),
			text({ " setup () {", "" }),
			text({ "   return {}", "" }),
			text({ " }", "" }),
			text({ "}", "" }),
			text({ "</script>", "" }),
			text({ "", "" }),
			text({ "", "" }),
			text({ "<style lang='scss' scoped>", "" }),
			text({ "</style>" }),
		}),
	},
	ledger = {
		snip({
			trig = "ex",
			namr = "Expense",
			dscr = "Add expense",
		}, {
			func(year),
			text("/"),
			insert(1, ""),
			text("/"),
			insert(2, ""),
			text({ " * " }),
			insert(3, ""),
			text({ "", "" }),
			text({ "  Assets:" }),
			insert(4),
			text({ "       €" }),
			insert(5),
			text({ "", "" }),
			text({ "  Expenses:" }),
			insert(6),
		}),
	},
})

require("plugins.snippets.all")
require("plugins.snippets.vimwiki")
