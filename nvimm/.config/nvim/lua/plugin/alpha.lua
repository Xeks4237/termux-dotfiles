-- alpha: Plugin which adds custom greeting screen to NeoVim
vim.pack.add {
	{
		src = 'https://github.com/goolord/alpha-nvim',
		name = 'alpha',
	},
}

-- Configuration for alpha-nvim
local dashboard = require 'alpha.themes.dashboard'

-- Set header/logo
dashboard.section.header.val = {
	'                                                         ',
	'             The Best NeoVim Distro of ALL TIME          ',
	'   ███╗   ██╗██╗   ██╗      ████████╗████████╗███████╗   ',
	'   ████╗  ██║██║   ██║      ██╔═════╝██╔═══██║██╔═══██╗  ',
	'   ██╔██╗ ██║██║   ██║█████╗██║  ███╗██║   ██║██║   ██║  ',
	'   ██║╚██╗██║╚██╗ ██╔╝╚════╝██║   ██║██║   ██║██║   ██║  ',
	'   ██║ ╚████║ ╚████╔╝       ████████║████████║███████╔╝  ',
	'   ╚═╝  ╚═══╝  ╚═══╝        ╚═══════╝╚═══════╝╚══════╝   ',
	'   by Xeks4237                                  meow :3  ',
}

-- Sets buttons which gonna be shown below the logo with their icons
dashboard.section.buttons.val = {
	dashboard.button('n', '  New File', '<cmd>ene | startinsert<CR>'), -- Opens a new file
	dashboard.button('m', '  Mason', '<cmd>Mason<CR>'), -- Opens ui of mason.nvim
	-- dashboard.button("q", " Get Help", ""), -- Future documentation gonna go here
	dashboard.button('?', '  Keymaps', "<cmd>lua require('which-key').show('', { mode = 'n' })<CR>"), -- Shows popup of which-key plugin with most the keymaps
	dashboard.button('q', '  Quit', '<cmd>qa<CR>'), -- Quits nvim
}

-- Send/Setup config of alpha
require('alpha').setup(dashboard.opts)
