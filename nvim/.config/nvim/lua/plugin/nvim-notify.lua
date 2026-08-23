vim.pack.add {
	{
		src = 'https://github.com/rcarriga/nvim-notify',
		name = 'nvim-notify',
	},
}

vim.notify = require 'notify'
require('notify').setup {
	background_colour = 'NotifyBackground',
	fps = 60,
	icons = {
		DEBUG = '',
		ERROR = '',
		INFO = '',
		TRACE = '✎',
		WARN = '',
	},
	level = 2, -- INFO and above
	minimum_width = 25,
	render = 'default',
	stages = 'slide',
	time_formats = {
		notification = '%T',
		notification_history = '%FT%T',
	},
	timeout = 2500,
	top_down = false,
}
