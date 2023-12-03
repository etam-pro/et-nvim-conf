---ttype MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    -- Find files only in version control. Very helpful for filtering huge folders like node_modules.
    ["<leader>fg"] = { "<cmd> Telescope git_files <cr>", "Find git files" },

    -- Global search by text
    ["<leader>lg"] = { "<cmd> Telescope live_grep search_dirs=. <cr>", "Find in files" },

    -- Shorthand to open Lazy panel
    ["<leader>lz"] = { "<cmd> Lazy <cr>", "Open Lazy Panel" },

    -- Shorthand to open Mason panel
    ["<leader>ls"] = { "<cmd> Mason <cr>", "Open Mason Panel" },

    -- add a breakpoint to current cursor location
    ["<leader>db"] = { "<cmd> lua require('dap').toggle_breakpoint() <cr>", "Toggle Debugger Breakpoint" },

    -- open the debugger UI
    ["<leader>dd"] = { "<cmd> lua require('dapui').open() <cr>", "Open Debugger Session" },

    -- close the debugger UI
    ["<leader>dx"] = { "<cmd> lua require('dapui').close() <cr>", "Close Debugger Session" },

    -- start a debugging session
    ["<leader>dc"] = { "<cmd> lua require('dap').continue() <cr>", "Continue Debugger Session" },

    -- clear all breakpoints
    ["<leader>df"] = { "<cmd> lua require('dap').clear_breakpoints() <cr>", "Clear all Breakpoints" },

    -- open the LazyGit panel
    ["<leader>gg"] = { "<cmd> LazyGit <cr>", "Open LazyGit" },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

-- more keybinds!

return M
