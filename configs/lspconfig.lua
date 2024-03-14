local configs = require("nvchad.configs.lspconfig")

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")

-- if you just want default config for the servers then put them in a table
local servers = {
	"html",
	"cssls",
	"tsserver",
	"tailwindcss",
	"clangd",
	"golangci_lint_ls",
	"gopls",
	"rubocop",
	"pyright",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_init = on_init,
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

-- Solargraph provides much faster autoformat than rubocop for ruby,
-- but required some manual setup.
lspconfig.solargraph.setup({
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
})

lspconfig.ltex.setup({
	on_attach = on_attach,
	cmd = { "ltex-ls" },
	filetypes = { "text", "markdown" },
	flags = { debounce_text_changes = 300 },
})
