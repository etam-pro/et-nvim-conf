require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

-- Find files only in version control. Very helpful for filtering huge folders like node_modules.
map("n",  "<leader>fg",  "<cmd> Telescope git_files <cr>", { desc = "Find git files" })

-- Global search by text
map("n","<leader>lg",  "<cmd> Telescope live_grep search_dirs=. <cr>", { desc = "Find in files" })

-- Shorthand to open Lazy panel
map("n","<leader>lz", "<cmd> Lazy <cr>", { desc = "Open Lazy Panel" })

-- Shorthand to open Mason panel
map("n","<leader>ls",  "<cmd> Mason <cr>", { desc = "Open Mason Panel" })

-- add a breakpoint to current cursor location
map("n","<leader>db",  "<cmd> lua require('dap').toggle_breakpoint() <cr>", { desc = "Toggle Debugger Breakpoint" })

-- open the debugger UI
map("n", "<leader>dd" , "<cmd> lua require('dapui').open() <cr>", { desc = "Open Debugger Session" })

-- close the debugger UI
map("n", "<leader>dx", "<cmd> lua require('dapui').close() <cr>", { desc = "Close Debugger Session" })

-- start a debugging session
map("n", "<leader>dc",  "<cmd> lua require('dap').continue() <cr>", { desc = "Continue Debugger Session" })

-- clear all breakpoints
map("n", "<leader>df",  "<cmd> lua require('dap').clear_breakpoints() <cr>", { desc = "Clear all Breakpoints" })

-- open the LazyGit panel
map("n", "<leader>gg",  "<cmd> LazyGit <cr>", { desc = "Open LazyGit" })

map("v", ">", ">gv", { desc = "indent" })
