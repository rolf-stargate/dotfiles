local ls = require("luasnip")
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
	vimwiki = {
		snip({
			trig = "co",
			namr = "Code Block",
			dscr = "Code block in markdown",
		}, {
			text("```"),
			insert(1),
			text({ "", "" }),
			text("```"),
		}),
		snip({
			trig = "letter",
			namr = "Letter Template",
			dscr = "Letter template in markdown",
		}, {
			text({ "---", "" }),
			text({ "fromname: Paul Saynisch", "" }),
			text({ "fromaddress: |", "" }),
			text({ "  Fritz-Siemon-Str. 26\\", "" }),
			text({ "  04347 Leipzig", "" }),
			text({ "place: Leipzig", "" }),
			text({ "to: |", "" }),
			text({ "  " }),
			insert(1),
			text({ "", "" }),
			text({ "date: " }),
			func(dateDE),
			text({ "", "" }),
			text({ "subject: " }),
			insert(2),
			text({ "", "" }),
			text({ "signature: Paul Saynisch", "" }),
			text({ "---", "" }),
		}),
    snip({
      trig = "log",
      namr = "Logging Template",
      dsct = "Logging template in vimwiki",
    }, {
      text({"*Date:* "}),
      func(date),
      text({ "", "" }),
      text({ "", "" }),
      text({ "**Environment Details:** ", "" }),
      text({ "", "" }),
      text({ "*Platform:* ", "" }),
      text({ "*User:* ", "" }),
      text({ "*Hostname:* ", "" }),
      text({ "*Port:* ", "" }),
      text({ "", "" }),
      text({ "**Service Details:** ", "" }),
      text({ "", "" }),
      text({ "*Service Name:* ", "" }),
      text({ "*Command:* ", "" }),
      text({ "*Management Tool:* ", "" }),
      text({ "", "" }),
      text({ "**Configuration Files:** ", "" }),
      text({ "", "" }),
      text({ "*Configuration File:*", "" }),
      text({ "", "" }),
      text({ "**Configuration Files:** ", "" }),
      text({ "", "" }),
      text({ "", "" }),
      text({ "**Setup Notes:** ", "" }),
      text({ "", "" }),
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
