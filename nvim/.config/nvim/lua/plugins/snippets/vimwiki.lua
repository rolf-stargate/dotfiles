-- |////|__ VIMWIKI/MARKDOWN SNIPPETS __|/////////////////////////////////|»)-->
-- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- =======  SETUP  ============================================================>
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
-- <============================================================  SETUP  =======

-- =======  UTILITY FUNCTIONS  ================================================>
-- Function to transform text to uppercase
local function to_upper(args)
	return string.upper(args[1][1])
end

-- Function to get current date
local date = function()
	return { os.date("%Y-%m-%d") }
end

-- Function to get current date german format
local dateDE = function()
	return { os.date("%d.%m.%Y") }
end

-- Helper function to determine indentation level (optional step if indentation matters)
local function get_indent_length()
	local cursor = vim.api.nvim_win_get_cursor(0)
	local line = vim.api.nvim_get_current_line()
	return vim.fn.indent(cursor[1])
end

-- Function to compute padding between start and end text
local function fill_between(target_length, start_text, end_text, fill_char, indent_length)
	local total_length = target_length - indent_length
	local start_length = #start_text
	local end_length = #end_text
	local current_length = start_length + end_length

	local fill_length = total_length - current_length
	return start_text .. string.rep(fill_char, fill_length) .. end_text
end

-- <================================================  UTILITY FUNCTIONS  =======

-- =======  SNIPPETS  =========================================================>
-- h1
ls.add_snippets("vimwiki", {
	s("h1", {
		descr = "Create H1 Heading Block",
		func(function(args)
			local indent_length = get_indent_length()
			local fill_char = "/"
			local start_text = "<!-- |////|__ " .. string.upper(args[1][1]) .. " __|"
			local end_text = "|») -->"
			return fill_between(81, start_text, end_text, fill_char, indent_length)
		end, { 1 }),
		t({ "", "" }),
		func(function(args)
			local indent_length = get_indent_length()
			local fill_char = ":"
			local start_text = "<!-- "
			local end_text = " -->"
			return fill_between(80, start_text, end_text, fill_char, indent_length)
		end, { 1 }),
		t({ "", "# " }),
		insert(1, "INSERT1"),
		insert(2),
		t({ "", "" }),
		func(function(args)
			local indent_length = get_indent_length()
			local fill_char = ":"
			local start_text = "<!-- "
			local end_text = ":"
			return fill_between(80, start_text, end_text, fill_char, indent_length)
		end, { 1 }),
		t({ "", "" }),
		func(function(args)
			local indent_length = get_indent_length()
			local fill_char = "/"
			local start_text = "<!-- («|"
			local end_text = "|__ " .. string.upper(args[1][1]) .. " __|////| -->"
			return fill_between(81, start_text, end_text, fill_char, indent_length)
		end, { 1 }),
	}),
})

-- h2
ls.add_snippets("vimwiki", {
	s("h2", {
		descr = "Create H2 Heading Block",
		func(function(args)
			local indent_length = get_indent_length()
			local fill_char = "="
			local start_text = "<!-- "
			local end_text = "  " .. string.upper(args[1][1]) .. "  ======= -->"
			return fill_between(80, start_text, end_text, fill_char, indent_length)
		end, { 1 }),
		t({ "", "## " }),
		insert(1, "INSERT"),
		insert(2),
		t({ "", "" }),
		t({ "", "" }),
		func(function(args)
			local indent_length = get_indent_length()
			local fill_char = "="
			local start_text = "<!-- "
			local end_text = "» " .. string.upper(args[1][1]) .. " «======= -->"
			return fill_between(82, start_text, end_text, fill_char, indent_length)
		end, { 1 }),
	}),
})

-- h3
ls.add_snippets("vimwiki", {
	s("h3", {
		descr = "Create H3 Heading Block",
		func(function(args)
			local indent_length = get_indent_length()
			local fill_char = "-"
			local start_text = "<!--"
			local end_text = "  " .. string.upper(args[1][1]) .. "  ---------->"
			return fill_between(80, start_text, end_text, fill_char, indent_length)
		end, { 1 }),
		t({ "", "## " }),
		insert(1, "INSERT1"),
		insert(2),
		t({ "", "" }),
		t({ "", "" }),
		func(function(args)
			local indent_length = get_indent_length()
			local fill_char = "-"
			local start_text = "<!--"
			local end_text = "» " .. string.upper(args[1][1]) .. " «---------->"
			return fill_between(80, start_text, end_text, fill_char, indent_length)
		end, { 1 }),
	}),
})

-- Codeblock
ls.add_snippets("vimwiki", {
	s("vwcodeblock", {
		dscr = "Code block in markdown",
		t("```"),
		insert(1),
		t({ "", "" }),
		t("```"),
	}),
})

-- Codeblock
ls.add_snippets("vimwiki", {
	s("vwiletter", {
		dscr = "Latex Letter Template",
		t({ "---", "" }),
		t({ "fromname: Paul Saynisch", "" }),
		t({ "fromaddress: |", "" }),
		t({ "  Fritz-Siemon-Str. 26\\", "" }),
		t({ "  04347 Leipzig", "" }),
		t({ "place: Leipzig", "" }),
		t({ "to: |", "" }),
		t({ "  " }),
		insert(1),
		t({ "", "" }),
		t({ "date: " }),
		func(dateDE),
		t({ "", "" }),
		t({ "subject: " }),
		insert(2),
		t({ "", "" }),
		t({ "signature: Paul Saynisch", "" }),
		t({ "---", "" }),
	}),
})

-- Configuration Logging Template
ls.add_snippets("vimwiki", {
	s("vwilogconf", {
		dscr = "Configuration Logging Template",
		t({ "*Date:* " }),
		func(date),
		t({ "", "" }),
		t({ "", "" }),
		t({ "**Environment Details:** " }),
		insert(1),
		t({ "", "" }),
		t({ "*Platform:* ", "" }),
		t({ "*User:* ", "" }),
		t({ "*Hostname:* ", "" }),
		t({ "*Port:* ", "" }),
		t({ "", "" }),
		t({ "**Service Details:** ", "" }),
		t({ "", "" }),
		t({ "*Service Name:* ", "" }),
		t({ "*Command:* ", "" }),
		t({ "*Management Tool:* ", "" }),
		t({ "", "" }),
		t({ "**Configuration Files:** ", "" }),
		t({ "", "" }),
		t({ "*Configuration File:*", "" }),
		t({ "", "" }),
		t({ "**Setup Notes:** ", "" }),
		t({ "", "" }),
	}),
})
-- <=========================================================  SNIPPETS  =======
-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- <--(«|/////////////////////////////////|__ VIMWIKI/MARKDOWN SNIPPETS __|////|
