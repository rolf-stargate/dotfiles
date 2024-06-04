local ok, dap = pcall(require, 'dap')
if not ok then
    return
end

--
-- See
-- https://sourceware.org/gdb/current/onlinedocs/gdb.html/Interpreters.html
-- https://sourceware.org/gdb/current/onlinedocs/gdb.html/Debugger-Adapter-Protocol.html
dap.adapters.gdb = {
    id = 'gdb',
    type = 'executable',
    command = 'gdb',
    args = { '--quiet', '--interpreter=dap' },
}

dap.configurations.c = {
    {
        name = 'Run executable (GDB)',
        type = 'gdb',
        request = 'launch',
        -- This requires special handling of 'run_last', see
        -- https://github.com/mfussenegger/nvim-dap/issues/1025#issuecomment-1695852355
        program = function()
            local path = vim.fn.input({
                prompt = 'Path to executable: ',
                default = vim.fn.getcwd() .. '/build/main',
                completion = 'file',
            })

            return (path and path ~= '') and path or dap.ABORT
        end,
    },
    {
        name = 'Run executable with arguments (GDB)',
        type = 'gdb',
        request = 'launch',
        -- This requires special handling of 'run_last', see
        -- https://github.com/mfussenegger/nvim-dap/issues/1025#issuecomment-1695852355
        program = function()
            local path = vim.fn.input({
                prompt = 'Path to executable: ',
                default = vim.fn.getcwd() .. '/build/main',
                completion = 'file',
            })

            return (path and path ~= '') and path or dap.ABORT
        end,
        args = function()
            local args_str = vim.fn.input({
                prompt = 'Arguments: ',
            })
            return vim.split(args_str, ' +')
        end,
    },
    {
        name = 'Attach to process (GDB)',
        type = 'gdb',
        request = 'attach',
        processId = require('dap.utils').pick_process,
    },
}

-- ### ui #########################################################################
require("dapui").setup()

-- ### virtual text ###############################################################

require("nvim-dap-virtual-text").setup()

-- ### keymaps #####################################################################


vim.keymap.set("n", "<Leader>Db", ":lua require'dap'.toggle_breakpoint()<cr>", {
	noremap = true,
	silent = true,
	desc = "Toggle breakpoint",
})

vim.keymap.set("n", "<Leader>Dc", ":lua require'dap'.continue()<cr>", {
	noremap = true,
	silent = true,
	desc = "Continue",
})

vim.keymap.set("n", "<Leader>Dl", ":lua require'dap'.run_last()<cr>", {
	noremap = true,
	silent = true,
	desc = "Run last",
})

vim.keymap.set("n", "<F1>", ":lua require'dap'.step_into()<cr>", {
	noremap = true,
	silent = true,
	desc = "Step into",
})

vim.keymap.set("n", "<F4>", ":lua require'dap'.step_over()<cr>", {
	noremap = true,
	silent = true,
	desc = "Step out",
})

vim.keymap.set("n", "<F7>", ":lua require'dap'.step_out()<cr>", {
	noremap = true,
	silent = true,
	desc = "Step out",
})

vim.keymap.set("n", "<Leader>Do", ":lua require('dapui').toggle()<cr>", {
	noremap = true,
	silent = true,
	desc = "open REPL",
})
