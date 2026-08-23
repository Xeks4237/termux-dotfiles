-- todo-comments: Highlight todo, notes, etc in comments
vim.pack.add {
	{
		-- for example:
		-- NOTE:
		-- TODO:
		-- WARN:
		-- INFO:
		-- and .etc
		src = 'https://github.com/folke/todo-comments.nvim',
		name = 'todo-comments',
	},
}

-- Configuration for todo-comments
require('todo-comments').setup {
	signs = false,
}
