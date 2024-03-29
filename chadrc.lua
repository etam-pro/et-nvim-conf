local M = {}

M.ui = {
	theme = "onedark",
}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		"c",
		"markdown",
		"markdown_inline",
		"ruby",
		"go",
		"python",
	},
	indent = {
		enable = true,
		-- disable = {
		--   "python"
		-- },
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"deno",
		"prettier",
		"tailwindcss-language-server",

		-- c/cpp stuff
		"clangd",
		"clang-format",

		-- go stuff
		"delve",
		"gopls",
		"goimports",
		"golangci-lint",
		"golangci-lint-langserver",

		--  ruby stuff
		"rubocop",
		"ruby-lsp",
		"solargraph",

		-- generic stuff
		"sonarlint-language-server",
		"jq",
		"jq-lsp",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

return M
