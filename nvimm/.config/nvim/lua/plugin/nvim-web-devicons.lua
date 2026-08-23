-- nvim-web-devicons: allows to use nerd-font icons in nvim amd it's plugins
vim.pack.add {
	{
		src = 'https://github.com/nvim-tree/nvim-web-devicons',
		name = 'nvim-web-devicons',
	},
}

-- Configuration for nvim-web-devicons
require('nvim-web-devicons').setup {
	-- Globally enable different highlight colors per icon
	color_icons = true,

	-- Globally enable default icons
	default = true,

	-- Globally enable "strict" selection of icons
	strict = false,

	-- Set the light or dark variant manually
	-- nil by default, "light" or "dark" by default
	-- if it's equal to "nil" then it gonna be changed with current colorscheme
	variant = nil,

	-- Override blend value for all highlight groups
	-- nil by default
	blend = nil,

	-- Override by filename
	-- table by default, nil by default
	override_by_filename = {},

	-- Override by extension
	-- table by default, nil by default
	override_by_extension = {},

	-- Override by operating system
	-- table by default, nil by default
	override_by_operating_system = {},

	-- Override the default icons
	-- table by default, nil by default
	override = {},
}
