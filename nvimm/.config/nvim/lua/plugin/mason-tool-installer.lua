-- mason-tool-installer: Allows to easily install tools using mason automatically
vim.pack.add {
	{
		src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
		name = 'mason-tool-installer',
	},
}

-- Configuration for mason-tool-installer
require('mason-tool-installer').setup {
	-- a list of all tools you want to ensure are installed with mason
	ensure_installed = {
		-- NOTE: you can pin a tool to a particular version or
		-- turn off/on auto_update per tool, for example:
		-- { "golangci-lint", version = "v1.47.0", auto_update = false },
		-- [ Lua Related ]
		'lua-language-server', -- LSP for lua
		'stylua', -- Formatter for lua
		-- [ Shell/Bash/Zsh Related ]
		'bash-language-server', -- LSP for sh/bash/zsh
		'shfmt', -- Formatter for sh/bash
		'beautysh', -- Formatter for zsh
		-- 'bash-debug-adapter', -- Debug adapter for bash
		-- [ C and C++ Related ]
		-- 'cpplint', -- Linter for c and c++
		-- 'cpptools', -- DAP for c and c++
		-- [ For Everything ]
		'prettierd', -- Formatter for many languages
		'codebook', -- LSP for spell checking...
		'tree-sitter-cli', -- treesitter cli tool for treesitter plugin
		-- Add more tools by writing their names from mason ui (can be opened with :Mason)
	},

	-- if set to true this will check each tool for updates. If updates
	-- are available the tool will be updated. This setting does not
	-- affect :MasonToolsUpdate or :MasonToolsInstall.
	-- Default: false
	auto_update = true,

	-- automatically install / update on startup. If set to false nothing
	-- will happen on startup. You can use :MasonToolsInstall or
	-- :MasonToolsUpdate to install tools and check for updates.
	-- Default: true
	run_on_start = true,

	-- set a delay (in ms) before the installation starts. This is only
	-- effective if run_on_start is set to true.
	-- e.g.: 5000 = 5 second delay
	start_delay = 3000, -- 3 second delay

	-- Only attempt to install if "debounce_hours" number of hours has
	-- elapsed since the last time Neovim was started. This stores a
	-- timestamp in a file named stdpath("data")/mason-tool-installer-debounce.
	-- This is only relevant when you are using "run_on_start". It has no
	-- effect when running manually via ":MasonToolsInstall" etc....
	-- Default: nil
	debounce_hours = 12, -- 12 equals to 12 hours between attempts to install/update

	-- By default all integrations are enabled. If you turn on an integration
	-- and you have the required module(s) installed this means you can use
	-- alternative names, supplied by the modules, for the thing that you want
	-- to install. If you turn off the integration (by setting it to false) you
	-- cannot use these alternative names. It also suppresses loading of those
	-- module(s) (assuming any are installed) which is sometimes wanted when
	-- doing lazy loading.
	integrations = {
		['mason-lspconfig'] = true, -- Requires mason-lspconfig
		['mason-nvim-dap'] = true, -- Requires mason-nvim-dap
	},
}
