# nvim-conf

![demo](nvim.gif)

This is a Neovim configuration built upon [NvChad](https://nvchad.com/) as the
base. Some plugins added on top includes the following:

- [copilot.lua](https://github.com/zbirenbaum/copilot.lua) Github Copilot nvim
  plugin implemented in lua.
- [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) Nvim Plugin to open
  [LazyGit](https://github.com/jesseduffield/lazygit)
- [conform.vim](https://github.com/stevearc/conform.nvim) Autoformatter
- [nvim-dap](https://github.com/mfussenegger/nvim-dap) Nvim debugger adapter
  protocol
- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) Nvim UI plugin for
  nvim-dap-ui

## Author

- [Edward Tam](https://github.com/etam-pro)

## Contributors

- [Ari Bapna](https://github.com/ArihantBapna)

## Context

- [LSP supported languages](#lsp-supported-languages)
- [Autoformatter](#autoformatter)
- [Install](#install)
  - [Installing Prerequesites](#installing-prerequisites)
  - [Cloning the Configuration](#cloning-the-configuration)
  - [Installing Plugins](#installing-plugins)
- [Custom Mappings](#custom-mappings)
- [Resources](#resources)

## LSP supported languages

- html
- css
  - cssls
  - tailwindcss-language-server
- golang
  - gopls
- ruby
  - rubocop
  - ruby-lsp
  - solargraph
- typescript
  - typescript-language-server
- python
  - pyright
- json
  - jq
  - jq-lsp

## Autoformatter

- golang
  - goimports
  - gofmt
- ruby
  - solargraph
- typescript
  - prettier
- python
  - black

## Install

### Installing Prerequisites

Please make sure you install
[NvChad](https://nvchad.com/docs/quickstart/install).

IMPORTANT: [Ripgrep](https://github.com/BurntSushi/ripgrep) is marked as
optional but is _required_ for `live grep`command to work.

Install [NodeJS 18+.](https://nodejs.org/en). If you are using a virtual
environment (i.e. `nvm`), make user global node version is set to 18+.

Install Ruby 3.2.2. If you are using a virtual environmetn (i.e.
[rvm](https://rvm.io/), [rbenv](https://github.com/rbenv/rbenv)) make sure
global version is set to 3.2.2.

Install [Go v1.18+](https://go.dev/doc/install).

Install [ltex](https://valentjn.github.io/ltex/) (for grammar checking in
Markdowns and Text):

```bash
brew install ltex-ls
```

### Cloning the configuration

Run the following command to clone the configuration (IMPORTANT: will overrride
all custom settings):

```bash
rm -rf $HOME/.config/nvim/lua && git clone https://github.com/etam-pro/et-nvim-conf.git $HOME/.config/nvim/lua
```

Open neovim:

```
nvim
```

### Installing Plugins

To install all the plugins through [Lazy](https://github.com/folke/lazy.nvim),
type in the following command:

```
:Lazy sync
```

\*\*Might need to restart nvim at this point for the plugins to be effective.

To install all LSP, Linters and Formatters through Mason, type in the following
command:

```
:MasonInstallAll
```

To login to Copilot:

```
:Copilot auth
```

You should be set to go!

# Custom Mappings

NOTE: `leader` is current set to `space`.

```lua
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

```

## Resources

- [Vim Cheatsheet](https://vim.rtorr.com/)
- [Vim Tips](https://www.youtube.com/watch?v=13gNtgqzzmM) (Youtube Video)
