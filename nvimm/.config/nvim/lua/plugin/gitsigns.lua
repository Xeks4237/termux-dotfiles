-- gitsigns: Plugin which adds git related signs to the gutter, as well as utilities for managing changes
vim.pack.add {
	{
		src = 'https://github.com/lewis6991/gitsigns.nvim',
		name = 'gitsigns',
	},
}

-- Configuration for gitsigns
require('gitsigns').setup {
	-- NOTE: See ":help gitsigns" to understand what the configuration keys do
	-- Icons in right of a NeoVim which are shows what kind of changes was made to git tracked files
	signs = {
		add = { text = '+' },
		change = { text = '~' },
		delete = { text = '_' },
		topdelete = { text = '‾' },
		changedelete = { text = '~' },
	},
}

-- Navigation
vim.keymap.set('n', '<leader>g]', function()
	if vim.wo.diff then
		vim.cmd.normal { ']c', bang = true }
	else
		require('gitsigns').nav_hunk 'next'
	end
end, { desc = '[g]it Next Change' })

vim.keymap.set('n', '<leader>g[', function()
	if vim.wo.diff then
		vim.cmd.normal { '[c', bang = true }
	else
		require('gitsigns').nav_hunk 'prev'
	end
end, { desc = '[g]it Previous Change' })

-- Actions
-- visual mode
vim.keymap.set('v', '<leader>gs', function()
	require('gitsigns').stage_hunk {
		vim.fn.line '.',
		vim.fn.line 'v',
	}
end, { desc = '[g]it [s]tage hunk' })
vim.keymap.set('v', '<leader>gr', function()
	require('gitsigns').reset_hunk {
		vim.fn.line '.',
		vim.fn.line 'v',
	}
end, { desc = '[g]it [r]eset hunk' })
-- normal mode
vim.keymap.set('n', '<leader>gs', require('gitsigns').stage_hunk, { desc = '[g]it [s]tage hunk' })
vim.keymap.set('n', '<leader>gr', require('gitsigns').reset_hunk, { desc = '[g]it [r]eset hunk' })
vim.keymap.set('n', '<leader>gS', require('gitsigns').stage_buffer, { desc = '[g]it [S]tage buffer' })
vim.keymap.set('n', '<leader>gu', require('gitsigns').stage_hunk, { desc = '[g]it [u]ndo stage hunk' })
vim.keymap.set('n', '<leader>gR', require('gitsigns').reset_buffer, { desc = '[g]it [R]eset buffer' })
vim.keymap.set('n', '<leader>gp', require('gitsigns').preview_hunk, { desc = '[g]it [p]review hunk' })
vim.keymap.set('n', '<leader>gb', require('gitsigns').blame_line, { desc = '[g]it [b]lame line' })
vim.keymap.set('n', '<leader>gd', require('gitsigns').diffthis, { desc = '[g]it [d]iff against index' })
vim.keymap.set('n', '<leader>gD', function()
	require('gitsigns').diffthis '@'
end, { desc = '[g]it [D]iff against last commit' })
-- Toggle Options
vim.keymap.set('n', '<leader>gtb', require('gitsigns').toggle_current_line_blame, { desc = '[t]oggle [b]lame Line' })
vim.keymap.set('n', '<leader>gtd', require('gitsigns').preview_hunk_inline, { desc = '[t]oggle [d]eleted Lines' })
