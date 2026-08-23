-- nvim-autopairs: Plugin for auto closing () {} [] and etc with extra logic
vim.pack.add {
	{
		src = 'https://github.com/windwp/nvim-autopairs',
		name = 'nvim-autopairs',
	},
}

-- Configuration for nvim-autopairs
require('nvim-autopairs').setup {
	-- List of filetypes where auto-pairs is disabled
	disable_filetype = {
		-- For Example:
		-- "TelescopePrompt",
		-- 'spectre_panel',
	},

	-- Disable when recording or executing a macro
	disable_in_macro = true,

	-- Disable when insert after visual block mode
	disable_in_visualblock = false,

	-- Disable in replace mode
	disable_in_replace_mode = true,

	-- Enable moving right after pairing
	enable_moveright = true,

	-- Add bracket pairs after quote
	enable_afterquote = true,

	-- Check bracket in same line
	enable_check_bracket_line = true,

	-- Enable brackets inside quotes
	enable_bracket_in_quote = true,

	-- Trigger abbreviation
	enable_abbr = false,

	-- Switch for basic rule break undo sequence
	break_undo = true,

	-- Enable treesitter checking
	check_ts = true,

	-- Map the <CR> key
	map_cr = true,

	-- Map the <BS> key
	map_bs = true,

	-- Map the <C-h> key to delete a pair
	map_c_h = false,

	-- Map <c-w> to delete a pair if possible
	map_c_w = false,

	-- Treesitter configuration
	ts_config = {},
}
