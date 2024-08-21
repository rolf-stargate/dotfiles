local last_move_time = os.time()
local save_interval = 30000 -- Interval in milliseconds
local timer

local function save()
	if vim.bo.modifiable and not vim.bo.readonly then
		vim.cmd("update")
	end
end

local function start_timer()
	if not timer then
		timer = vim.loop.new_timer()
		timer:start(
			save_interval,
			save_interval,
			vim.schedule_wrap(function()
				if (os.time() - last_move_time) * 1000 >= save_interval then
					save()
				end
			end)
		)
	end
end

local function stop_timer()
	if timer then
		timer:stop()
		timer:close()
		timer = nil
	end
end

-- Text files
local filetypes = { "*.md", "*.txt", "*.org" }
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = filetypes,
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.textwidth = 80
		last_move_time = os.time() -- Reset move time on buffer enter
		start_timer()
	end,
})

vim.api.nvim_create_autocmd("BufLeave", {
	pattern = filetypes,
	callback = function()
		save()
		stop_timer()
	end,
})

vim.api.nvim_create_autocmd("FocusLost", {
	pattern = filetypes,
	callback = function()
		save()
		stop_timer()
	end,
})

vim.api.nvim_create_autocmd("CursorMoved", {
	pattern = filetypes,
	callback = function()
		last_move_time = os.time()
	end,
})
