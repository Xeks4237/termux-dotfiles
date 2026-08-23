-- Setting options
-- Sources lua/options.lua file
require 'options'

-- Basic Keymaps
-- Sources lua/core-keymaps.lua file
require 'core-keymaps'

-- Load file which contains autocmds for NV-GOD
require 'autocmds'

require 'plugin.alpha'
require 'plugin.autopairs'
require 'plugin.catppuccin'
require 'plugin.conform'
require 'plugin.dracula'
require 'plugin.gitsigns'
require 'plugin.gruvbox'
require 'plugin.lualine'
require 'plugin.vim-tpipeline'
require 'plugin.mason'
require 'plugin.mason-lspconfig'
require 'plugin.mason-tool-installer'
require 'plugin.material'
require 'plugin.noice'
require 'plugin.plenary'
require 'plugin.nvim-colorizer'
require 'plugin.nvim-lspconfig'
require 'plugin.nvim-notify'
require 'plugin.nvim-web-devicons'
require 'plugin.quicker'
require 'plugin.render-markdown'
require 'plugin.todo-comments'
require 'plugin.tokyonight'
require 'plugin.treesitter-context'
require 'plugin.treesitter-endwise'
require 'plugin.treesitter'
require 'plugin.which-key'
require 'plugin.nvim-cmp'

vim.keymap.set('n', '<C-e>', '<cmd>Ex<CR>')

vim.pack.add { { src = 'https://github.com/MunifTanjim/nui.nvim', name = 'nui' } }

vim.lsp.enable 'lua_ls'

-- Set colorscheme
vim.cmd.colorscheme 'gruvbox'
