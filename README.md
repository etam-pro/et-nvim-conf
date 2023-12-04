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

Install [Go v18+](https://go.dev/doc/install).

### Cloning the configuration

Run the following command to clone the configuration (IMPORTANT: will overrride
all custom settings):

```bash
rm -rf $HOME/.config/nvim/lua/custom && git clone https://github.com/etam-pro/et-nvim-conf.git $HOME/.config/nvim/lua/custom
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

You should be set to go!

# Custom Mappings

NOTE: `leader` is current set to `space`.

```lua
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
```

## Resources

- [Vim Cheatsheet](https://vim.rtorr.com/)
- [Vim Tips](https://www.youtube.com/watch?v=13gNtgqzzmM) (Youtube Video)
