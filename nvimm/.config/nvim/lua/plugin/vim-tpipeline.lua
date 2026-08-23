-- vim-tpipeline: Combines NeoVim's status line with status line of tmux
vim.pack.add {
	{
		src = 'https://github.com/vimpostor/vim-tpipeline',
		name = 'vim-tpipeline',
	},
}

-- Configuration for vim-tpipeline
-- Make vim-tpipeline to don't embed itself to tmux status line itself
vim.g.tpipeline_autoembed = 0

-- tpipeline comes bundled with its own custom minimal statusline
-- vim.g.tpipeline_statusline = '%!tpipeline#stl#line()'

-- You can also use standard statusline syntax, see :help stl
-- vim.g.tpipeline_statusline = '%f'

vim.api.nvim_create_autocmd('User', {
	pattern = 'TpipelineSize',
	once = true,
	callback = function()
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
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = { 'fileformat', 'filename', 'diagnostics', 'diff', 'branch', 'location' },
				lualine_z = { 'mode' },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		}
	end,
})
