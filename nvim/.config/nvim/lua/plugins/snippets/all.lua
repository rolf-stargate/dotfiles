-- |////|__ VIMWIKI/MARKDOWN SNIPPETS __|/////////////////////////////////|»)-->
-- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- =======  SETUP  ============================================================>
local fmt = require("luasnip.extras.fmt").fmt
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local d = ls.dynamic_node
local sn = ls.snippet_node
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

local function get_visual(args, parent)
	if #parent.snippet.env.LS_SELECT_RAW > 0 then
		return sn(nil, insert(1, parent.snippet.env.LS_SELECT_RAW))
	else -- If LS_SELECT_RAW is empty, return a blank insert node
		return sn(nil, insert(1))
	end
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
		d(2, get_visual),
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

ls.add_snippets("all", {
	s("c2", {
		descr = "Medium Comment Block",
		insert(1, "NAME"),
		t({ "", "" }),
		func(function(args)
			local comment_strings = split(vim.bo.commentstring, "%%s")
			local start_comment_string = comment_strings[1] or ""
			local end_comment_string = comment_strings[2] or ""
			local indent_length = Get_indent_depth()
			local fill_char = "="
			local start_text = start_comment_string
			local end_text = "  " .. string.upper(args[1][1]):gsub("%s+", "_") .. "  =======" .. end_comment_string
			return Fill_between_with_char(80, start_text, end_text, fill_char, indent_length)
		end, { 1 }),
		t({ "", "" }),
		d(2, get_visual),
		t({ "", "" }),
		func(function(args)
			local comment_strings = split(vim.bo.commentstring, "%%s")
			local start_comment_string = comment_strings[1] or ""
			local end_comment_string = comment_strings[2] or ""
			local indent_length = Get_indent_depth()
			local fill_char = "="
			local start_text = start_comment_string
			local end_text = " »" .. string.upper(args[1][1]):gsub("%s+", "_") .. "« =======" .. end_comment_string
			return Fill_between_with_char(80, start_text, end_text, fill_char, indent_length)
		end, { 1 }),
	}),
})

ls.add_snippets("all", {
	s("c3", {
		descr = "Small Comment Block",
		insert(1, "NAME"),
		t({ "", "" }),
		func(function(args)
			local comment_strings = split(vim.bo.commentstring, "%%s")
			local start_comment_string = comment_strings[1] or ""
			local end_comment_string = comment_strings[2] or ""
			local indent_length = Get_indent_depth()
			local fill_char = "-"
			local start_text = start_comment_string
			local end_text = "  " .. string.upper(args[1][1]):gsub("%s+", "_") .. "  -------" .. end_comment_string
			return Fill_between_with_char(80, start_text, end_text, fill_char, indent_length)
		end, { 1 }),
		t({ "", "" }),
		d(2, get_visual),
		t({ "", "" }),
		func(function(args)
			local comment_strings = split(vim.bo.commentstring, "%%s")
			local start_comment_string = comment_strings[1] or ""
			local end_comment_string = comment_strings[2] or ""
			local indent_length = Get_indent_depth()
			local fill_char = "-"
			local start_text = start_comment_string
			local end_text = " »" .. string.upper(args[1][1]):gsub("%s+", "_") .. "« -------" .. end_comment_string
			return Fill_between_with_char(80, start_text, end_text, fill_char, indent_length)
		end, { 1 }),
	}),
})

-- <=========================================================  SNIPPETS  =======
-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- <--(«|/////////////////////////////////|__ VIMWIKI/MARKDOWN SNIPPETS __|////|
