-- catppuccin: Smoothing pastel theme for nvim
vim.pack.add {
	{
		src = 'https://github.com/catppuccin/nvim',
		name = 'catppuccin',
	},
}

-- Configuration for catppuccin
require('catppuccin').setup {
	integrations = {
		aerial = true,
		alpha = true,
		cmp = true,
		dashboard = true,
		flash = true,
		fzf = true,
		grug_far = true,
		gitsigns = true,
		headlines = true,
		illuminate = true,
		indent_blankline = { enabled = true },
		leap = true,
		lsp_trouble = true,
		mason = true,
		markdown = true,
		mini = true,
		native_lsp = {
			enabled = true,
			underlines = {
				errors = { 'undercurl' },
				hints = { 'undercurl' },
				warnings = { 'undercurl' },
				information = { 'undercurl' },
			},
			virtual_text = {
				errors = { 'bold' },
				hints = { 'bold' },
				warnings = { 'bold' },
				information = { 'bold' },
			},
		},
		navic = { enabled = true, custom_bg = 'lualine' },
		neotest = true,
		neotree = true,
		noice = true,
		notify = true,
		semantic_tokens = true,
		snacks = true,
		telescope = true,
		treesitter = true,
		treesitter_context = true,
		trouble = true,
		which_key = true,
	},
	styles = {
		comments = {},
		conditionals = {},
		loops = { 'bold' },
		functions = { 'bold' },
		keywords = {},
		strings = {},
		variables = {},
		numbers = { 'bold' },
		booleans = { 'bold' },
		properties = {},
		types = {},
		operators = { 'bold' },
		-- Forgetted about white mode users...
		-- sidebars = "dark",
		-- floats = "dark",
	},
}
