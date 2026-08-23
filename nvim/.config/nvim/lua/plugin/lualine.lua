-- lualine: Plugin for better and highly custimazible status line in the bottom for NeoVim
vim.pack.add {
	{
		src = 'https://github.com/nvim-lualine/lualine.nvim',
		name = 'lualine',
	},
}

-- Configuration for lualine
require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		always_show_tabline = true,
		globalstatus = true,
		refresh = {
			statusline = 500,
			tabline = 500,
			winbar = 500,
			refresh_time = 16, -- ~60fps
			events = {
				'WinEnter',
				'BufEnter',
				'BufWritePost',
				'SessionLoadPost',
				'FileChangedShellPost',
				'VimResized',
				'Filetype',
				'CursorMoved',
				'CursorMovedI',
				'ModeChanged',
			},
		},
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'location', 'branch', 'diff', 'diagnostics', 'fileformat' },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	inactive_sections = {},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
}
