---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>fg"] = { "<cmd> Telescope git_files <cr>", "Find git files" },
    ["<leader>lz"] = { "<cmd> Lazy <cr>", "Open Lazy Panel" },
    ["<leader>ls"] = { "<cmd> Mason <cr>", "Open Mason Panel" },
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

-- more keybinds!

return M
