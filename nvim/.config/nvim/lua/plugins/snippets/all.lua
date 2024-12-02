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

local function split(inputstr, sep)
	if sep == nil then
		sep = "%s" -- default delimiter is space
	end
	local t = {}
	for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
		print(str)
		table.insert(t, str)
	end
	return t
end

-- <================================================  UTILITY FUNCTIONS  =======

-- =======  SNIPPETS  =========================================================>

ls.add_snippets("all", {
	s("c1", {
		descr = "Big Comment Block",
		func(function(args)
			local comment_strings = split(vim.bo.commentstring, "%%s")
			local start_comment_string = comment_strings[1] or ""
			return start_comment_string .. "|////|__ "
		end),
		insert(1, "NAME"),
		func(function(args)
			local comment_strings = split(vim.bo.commentstring, "%%s")
			local start_comment_string = comment_strings[1] or ""
			local end_comment_string = comment_strings[2] or ""
			local indent_length = Get_indent_depth() + #args[1][1] + #start_comment_string + 9
			local fill_char = "/"
			local start_text = " __|"
			local end_text = "|»)" .. end_comment_string
			return Fill_between_with_char(80, start_text, end_text, fill_char, indent_length)
		end, { 1 }),
		t({ "", "" }),
		func(function(args)
			local comment_strings = split(vim.bo.commentstring, "%%s")
			local start_comment_string = comment_strings[1] or ""
			local end_comment_string = comment_strings[2] or ""
			local indent_length = Get_indent_depth()
			local fill_char = ":"
			local start_text = start_comment_string
			local end_text = end_comment_string
			return Fill_between_with_char(80, start_text, end_text, fill_char, indent_length)
		end, { 1 }),
		t({ "", "" }),
		func(function(args)
			local comment_strings = split(vim.bo.commentstring, "%%s")
			local start_comment_string = comment_strings[1] or ""
			local end_comment_string = comment_strings[2] or ""
			local indent_length = Get_indent_depth()
			local fill_char = ":"
			local start_text = start_comment_string
			local end_text = end_comment_string
			return Fill_between_with_char(80, start_text, end_text, fill_char, indent_length)
		end, { 1 }),
		t({ "", "" }),
		func(function(args)
			local comment_strings = split(vim.bo.commentstring, "%%s")
			local start_comment_string = comment_strings[1] or ""
			local end_comment_string = comment_strings[2] or ""
			local indent_length = Get_indent_depth()
			local fill_char = "/"
			local start_text = start_comment_string .. "(«|"
			local end_text = "|__ " .. string.upper(args[1][1]):gsub("%s+", "_") .. " __|////|" .. end_comment_string
			return Fill_between_with_char(80, start_text, end_text, fill_char, indent_length)
		end, { 1 }),
	}),
})

-- h2
ls.add_snippets("vimwiki", {
	s("c2", {
		descr = "Create H2 Heading Block",
		func(function(args)
			local indent_length = get_indent_length()
			local fill_char = "="
			local start_text = "<!-- "
			local end_text = "  " .. string.upper(args[1][1]) .. "  ======= -->"
			return fill_between(80, start_text, end_text, fill_char, indent_length)
		end, { 1 }),
		t({ "", "## " }),
		insert(1, "INSERT1"),
		insert(2),
		t({ "", "" }),
		t({ "", "" }),
		func(function(args)
			local indent_length = get_indent_length()
			local fill_char = "="
			local start_text = "<!-- "
			local end_text = ">  " .. string.upper(args[1][1]) .. "  <======= -->"
			return fill_between(80, start_text, end_text, fill_char, indent_length)
		end, { 1 }),
	}),
})

-- h3
ls.add_snippets("vimwiki", {
	s("c3", {
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
			local end_text = ":  " .. string.upper(args[1][1]) .. "  :---------->"
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
