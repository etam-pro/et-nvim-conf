local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "tsserver",
  "clangd",
  "golangci_lint_ls",
  "gopls",
  "rubocop",
  "pyright",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Solargraph provides much faster autoformat than rubocop for ruby,
-- but required some manual setup.
lspconfig.solargraph.setup {
  cmd = { "solargraph", "stdio" },
  filetypes = { "ruby" },
  root_dir = lspconfig.util.root_pattern("Gemfile", ".git"),
  settings = {
    solargraph = {
      autoformat = true,
      diagnostics = true,
      completion = true,
      folding = true,
      references = true,
      rename = true,
      symbols = true,
    },
  },
}
