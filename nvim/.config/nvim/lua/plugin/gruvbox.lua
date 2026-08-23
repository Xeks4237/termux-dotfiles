vim.pack.add {
	{
		src = 'https://github.com/ellisonleao/gruvbox.nvim',
		name = 'gruvbox',
	},
}

-- Configuration for gruvbox colorscheme
require('gruvbox').setup {
	terminal_colors = true, -- Enable Gruvbox colors in Neovim's terminal
	undercurl = true, -- Enable undercurl for spell checking
	underline = true, -- Enable underlines for certain syntax
	bold = true, -- Enable bold text for certain syntax
	italic = {
		strings = false, -- Disable italic strings
		emphasis = true, -- Enable italic for emphasis (e.g., Markdown)
		comments = false, -- Enable italic comments
		operators = true, -- Enable italic operators
		folds = true, -- Enable italic for folds
	},
	strikethrough = true, -- Enable strikethrough for certain syntax
	invert_selection = true, -- Invert colors in visual selection
	invert_signs = false, -- Don't invert signs (e.g., git gutter, diagnostics)
	invert_tabline = false, -- Don't invert tabline
	invert_intend_guides = false, -- Don't invert indent guides
	inverse = true, -- Enable inverse for search, diffs, etc.
	contrast = 'medium', -- Options: "hard", "medium", "soft"
	dim_inactive = false, -- Don't dim inactive windows
	transparent_mode = false, -- Disable transparent background
}
