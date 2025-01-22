local colorscheme = "stargate"
-- local colorscheme = "abscs"
-- local colorscheme = "neon"
-- vim.g.neon_style = "dark"
-- local colorscheme = "kat.nwim"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
end
