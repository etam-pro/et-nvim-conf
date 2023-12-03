---ttype MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>fg"] = { "<cmd> Telescope git_files <cr>", "Find git files" },
    ["<leader>lz"] = { "<cmd> Lazy <cr>", "Open Lazy Panel" },
    ["<leader>ls"] = { "<cmd> Mason <cr>", "Open Mason Panel" },

    ["<leader>db"] = { "<cmd> lua require('dap').toggle_breakpoint() <cr>", "Toggle Debugger Breakpoint" },
    ["<leader>dd"] = { "<cmd> lua require('dapui').open() <cr>", "Open Debugger Session" },
    ["<leader>dx"] = { "<cmd> lua require('dapui').close() <cr>", "Close Debugger Session" },
    ["<leader>dc"] = { "<cmd> lua require('dap').continue() <cr>", "Continue Debugger Session" },
    ["<leader>df"] = { "<cmd> lua require('dap').clear_breakpoints() <cr>", "Clear all Breakpoints" },

    ["<leader>lg"] = { "<cmd> Telescope live_grep search_dirs=. <cr>", "Find in files" },

    ["<leader>gg"] = { "<cmd> LazyGit <cr>", "Open LazyGit" },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

-- more keybinds!

return M
