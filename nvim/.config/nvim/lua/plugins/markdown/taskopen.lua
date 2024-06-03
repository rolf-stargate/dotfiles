function Taskopen_get_uuid(line)
    local uuid_dirty = line:match("#([^#%s]*)$")
    local uuid = uuid_dirty:gsub("^%s*(.-)%s*$", "%1")
    return uuid
end

function Taskopen_annotation_marker_insert(line)
    if not line:find("**NOTE**") then
        vim.cmd("normal! $F#hi**NOTE**")
    end
end

function Taskopen_task_annotate_with_note()
    vim.cmd(":w") -- Save the file
    local line = vim.fn.getline(".")
    local uuid = Taskopen_get_uuid(line)
    Taskopen_annotation_marker_insert(line)
    local cmd = "FloatermNew --autoclose=1 taskopen -A " .. uuid
    vim.cmd(cmd)
end

-- Define the command
vim.cmd("command! TaskAnnotateWithNote lua Taskopen_task_annotate_with_note()")

vim.keymap.set("n", "<Leader>tn", ":TaskAnnotateWithNote<cr>", {
	noremap = true,
	silent = true,
	desc = "Create Note for Task",
})

