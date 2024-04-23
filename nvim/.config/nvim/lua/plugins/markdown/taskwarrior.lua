-- Require
require("m_taskwarrior_d").setup({
	-- The order of toggling task statuses
	task_statuses = { " ", ">", "x", "~" },
	-- The mapping between status and symbol in checkbox
	status_map = { [" "] = "pending", [">"] = "started", ["x"] = "completed", ["~"] = "deleted" },
	-- More configurations will be added in the future
})
-- Optional
