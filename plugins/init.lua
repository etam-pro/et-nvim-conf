---@type NvPluginSpec[]
local plugins = {
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = {
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
		},
	},

	-- Override plugin definition options
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
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
		},
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
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			git = { enable = true },
			renderer = {
				highlight_git = true,
				icons = {
					show = {
						git = true,
					},
				},
			},
		},
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = {
					auto_refresh = true,
				},
				suggestion = {
					auto_trigger = true,
				},
			})
		end,
	},

	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},

	{
		"stevearc/conform.nvim",
		lazy = false,
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettier" },
					javascriptreact = { "prettier" },
					typescript = { "prettier" },
					typescriptreact = { "prettier" },
					go = { "gofmt", "goimports" },
					python = { "black" },

					-- NOTE: ruby formatter is done with LSP using solargraph

					["_"] = { "trim_whitespace" },
				},

				format_on_save = {
					timeout_ms = 5000,
					lsp_fallback = true,
				},
			})
		end,
	},

	-- Debuggers

	"rcarriga/nvim-dap-ui",
	"leoluz/nvim-dap-go",
	{
		"folke/neodev.nvim",
		config = function()
			require("neodev").setup({
				library = {
					plugins = { "nvim-dap-ui" },
					types = true,
				},
			})
		end,
	},

	{
		"mfussenegger/nvim-dap",
		lazy = false,
		config = function()
			local dap = require("dap")

			dap.adapters.ruby = function(callback, config)
				callback({
					type = "server",
					host = "127.0.0.1",
					port = 38681,
					executable = {
						command = "bundle",
						args = {
							"exec",
							"rdbg",
							"-n",
							"--open",
							"--port",
							"${port}",
							"-c",
							"--",
							"bundle",
							"exec",
							config.command,
							config.script,
						},
					},
				})
			end

			dap.configurations.ruby = {
				{
					type = "ruby",
					name = "debug current file",
					request = "attach",
					localfs = true,
					command = "ruby",
					script = "${file}",
				},
				{
					type = "ruby",
					name = "run current spec file",
					request = "attach",
					localfs = true,
					command = "rspec",
					script = "${file}",
				},
			}

			require("dap-go").setup()
			require("dapui").setup()
		end,
	},

	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		lazy = false,
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	{
		"windwp/nvim-ts-autotag",
		lazy = false,
		config = function()
			require("nvim-ts-autotag").setup({
				autotag = {
					enable = true,
					enable_rename = true,
					enable_close = true,
					enable_close_on_slash = true,
					filetypes = { "html", "xml", "javascriptreact", "typescriptreact", "svelte", "vue", "eruby" },
				},
			})
		end,
	},

	-- amongst your other plugins
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		lazy = false,
		opts = {
			open_mapping = [[<c-\>]],
			hide_numbers = true, -- hide the number column in toggleterm buffers
			close_on_exit = true, -- close the terminal window when the process exits
			auto_insert = true, -- automatically insert a terminal command in insert mode
			auto_scroll = true, -- scroll when text is added in normal mode
		},
	},

	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("refactoring").setup()
		end,
	},
	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },

	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
	-- {
	--   "mg979/vim-visual-multi",
	--   lazy = false,
	-- }
}

return plugins
